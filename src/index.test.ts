import { describe, expect, test } from "bun:test";
import { hello } from "./index.ts";

describe("hello", () => {
  test("returns greeting", () => {
    expect(hello("world")).toBe("Hello, world!");
  });
});
