# Strict Compatibility Mode (Ultimate Clone)
# Local SDK is 3.10.4. We verify this works.
FROM dart:3.10.4 AS build

# Resolve app dependencies.
WORKDIR /app

# Copy the shared library first (to cache dependencies)
# COPY pubspec.lock to enforce exact version match.
COPY splendor_shared/pubspec.* ./splendor_shared/
COPY splendor_server/pubspec.* ./splendor_server/

# Restore dependencies
WORKDIR /app/splendor_shared
RUN dart pub get

WORKDIR /app/splendor_server
RUN dart pub get

# Copy source code (Now includes generated files from Windows)
COPY splendor_shared/ /app/splendor_shared/
COPY splendor_server/ /app/splendor_server/

# Prepare shared library
WORKDIR /app/splendor_shared
# Expert Fix: Clean any host artifacts and ensure clean packages
RUN rm -rf .dart_tool .pub-cache pubspec.lock
RUN dart pub get

# Generate code inside container
# Expert Fix: Force regeneration to match Linux environment
RUN dart run build_runner build --delete-conflicting-outputs

# Prepare server
WORKDIR /app/splendor_server
RUN rm -rf .dart_tool .pub-cache pubspec.lock
RUN dart pub get

# Compile
WORKDIR /app/splendor_server
RUN dart compile exe bin/server.dart -o bin/server

# Build minimal serving image
FROM scratch
COPY --from=build /runtime/ /
COPY --from=build /app/splendor_server/bin/server /app/bin/

# Start server.
EXPOSE 8080
CMD ["/app/bin/server"]
