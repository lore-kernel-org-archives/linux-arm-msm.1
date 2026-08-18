Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch [109.224.244.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 002BF348C5D
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 21:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787086817; cv=none; b=mGAHikrUMiLdD5wUe45wYTLr1bb8Kzi7v3KNqgnEPWgJ9f7cg63ljtvggnGIj/w5+jqDwJHGEbDmOOPAXfLz9DOgnBZCnev2RLAABp5HH7VW/FExhRov2bG1CwiqmEGQXJTUxze8N1aXfPiYDm1cAogCwWW0m+3bMMXGF8SkSRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787086817; c=relaxed/simple;
	bh=soUao1BPJ3E2l2Vtxuv3vxgh2KPFygJkkPJZsMLJNuo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Vad7/alwik+p7r9K9Mnp1N1ao0szZlL5BQYttw32tbFvTb/hRLKwW/MbnGJH4KKvjtc+fN1wJ0z6L201dUgwCQayOjIFpKpUw2spIMhWHhWkvkvN3PBW9L55rFDSKWd7jM4Xm62DN7p7oq7bOFFwS8TolCT9A3WynvyvulFy4Qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=UrdWGTzB; arc=none smtp.client-ip=109.224.244.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="UrdWGTzB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1787086805; x=1787346005;
	bh=rlxiW4Zkiar6zCrx9sKjEy5CevBL/iRiXlE1KEfcb9I=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=UrdWGTzB7kU3qSRvox/Cvpggn6YPdsazdVu9zP4V0PFiEiVWqhKmM0HfOLSxVbkc9
	 FwdaqW4p+hQUQATeb1ACxSUnmDJDk+7ZGfgRYeJyqIscQbgr3C0Afe1umyqMJf6wvZ
	 QKnAHGsMmjFHOt5XyqFBc7cotxtRt9FMWGgqSDAkMfLoBq9nLPiMyqqyQ9JUeBO+Bt
	 QN/1kMUUmed+LgHoQlxdmgIRYE7cqwMFaotmq79aYR+iSlbUtUM2qDAz8puRh2uHiU
	 BBEF/2v02dfKb7tqGed06JeFdOEFZsQoLNF96gqGHtA6GJt9w/LzjdMT0H5sj+3ENm
	 CbilFuEdHy1KA==
Date: Tue, 18 Aug 2026 21:00:02 +0000
To: oe-linux-nfc@lists.linux.dev
From: Kristian Brox <isyourbrainfoss@proton.me>
Cc: david+nfc@ixit.cz, krzysztof.kozlowski@linaro.org, luca.weiss@fairphone.com, linux-arm-msm@vger.kernel.org, Kristian Brox <isyourbrainfoss@proton.me>
Subject: [PATCH 3/3] arm64: dts: qcom: qcm6490-fairphone-fp5: add ST21NFCD NFC
Message-ID: <20260818205940.1973944-4-isyourbrainfoss@proton.me>
In-Reply-To: <20260818205940.1973944-1-isyourbrainfoss@proton.me>
References: <20260818205940.1973944-1-isyourbrainfoss@proton.me>
Feedback-ID: 203906395:user:proton
X-Pm-Message-ID: f4d78f3257736910410fb47c707789cbc728c725
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha256; boundary="------ac8cebf76cc1a65a6236cfda853955e800f0ddea014ff94d2aadce5300a58944"; charset=utf-8

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------ac8cebf76cc1a65a6236cfda853955e800f0ddea014ff94d2aadce5300a58944
Content-Type: multipart/mixed;
 boundary=03531655d452a23f3d2b42a26f8811442dde937d3483b851835f9576f9bb
From: Kristian Brox <isyourbrainfoss@proton.me>
To: oe-linux-nfc@lists.linux.dev
Cc: david+nfc@ixit.cz,
	krzysztof.kozlowski@linaro.org,
	luca.weiss@fairphone.com,
	linux-arm-msm@vger.kernel.org,
	Kristian Brox <isyourbrainfoss@proton.me>
Subject: [PATCH 3/3] arm64: dts: qcom: qcm6490-fairphone-fp5: add ST21NFCD NFC
Date: Tue, 18 Aug 2026 22:59:40 +0200
Message-ID: <20260818205940.1973944-4-isyourbrainfoss@proton.me>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260818205940.1973944-1-isyourbrainfoss@proton.me>
References: <20260818205940.1973944-1-isyourbrainfoss@proton.me>
MIME-Version: 1.0

--03531655d452a23f3d2b42a26f8811442dde937d3483b851835f9576f9bb
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Enable the ST21NFCD on i2c9 (0x08), IRQ TLMM 41, reset TLMM 38
active-high. Compatible is st,st21nfcd-i2c (raw NCI). ese-present and
uicc-present are unset; those links are unproven on this board.

Signed-off-by: Kristian Brox <isyourbrainfoss@proton.me>
---
diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index d48cf38b7..a485edd24 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -1006,7 +1006,14 @@ redriver_ss_in: endpoint {
 &i2c9 {
 	status = "okay";
 
-	/* ST21NFC NFC @ 28 */
+	nfc@8 {
+		compatible = "st,st21nfcd-i2c";
+		reg = <0x08>;
+		interrupt-parent = <&tlmm>;
+		interrupts = <41 IRQ_TYPE_LEVEL_HIGH>;
+		reset-gpios = <&tlmm 38 GPIO_ACTIVE_HIGH>;
+	};
+
 	/* VL53L3 ToF @ 29 */
 };
 

--03531655d452a23f3d2b42a26f8811442dde937d3483b851835f9576f9bb
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="publickey -
 isyourbrainfoss@proton.me - 0x99222460.asc"; name="publickey -
 isyourbrainfoss@proton.me - 0x99222460.asc"
Content-Type: application/pgp-keys; filename="publickey -
 isyourbrainfoss@proton.me - 0x99222460.asc"; name="publickey -
 isyourbrainfoss@proton.me - 0x99222460.asc"

LS0tLS1CRUdJTiBQR1AgUFVCTElDIEtFWSBCTE9DSy0tLS0tCkNvbW1lbnQ6IGh0dHBzOi8vZ29w
ZW5wZ3Aub3JnClZlcnNpb246IEdvcGVuUEdQIDIuMTAuMAoKeGpNRWFqR1U0UllKS3dZQkJBSGFS
dzhCQVFkQVJkaFRsODdNUnJZNlJsOC9FeUhRdmJjVWtqWXBEcmptcmZBRwoxNzV5djR2Tk5XbHpl
VzkxY21KeVlXbHVabTl6YzBCd2NtOTBiMjR1YldVZ1BHbHplVzkxY21KeVlXbHVabTl6CmMwQndj
bTkwYjI0dWJXVSt3c0FSQkJNV0NnQ0RCWUpxTVpUaEF3c0pCd2tRcVFlNkNIM2p3cWhGRkFBQUFB
QUEKSEFBZ2MyRnNkRUJ1YjNSaGRHbHZibk11YjNCbGJuQm5jR3B6TG05eVo2bTkwZmNOZ2Q0cVp6
NWFnV05OTmorbwpyTjkrOHc2TUVRZ0J4MElqR0NPcUF4VUtDQVFXQUFJQkFoa0JBcHNEQWg0QkZp
RUVtU0lrWU5Najl2RWxSS0JyCnFRZTZDSDNqd3FnQUFCcHVBUUNiUmgxb3VRMUVhQmlHWGtYeVhS
bjZkWTNaVjUzdXkrWHRRWGhtOWtpSFJBRDkKRkxROWtzdGJyVmx3WGlrUkl5OVpINUQ0R1VXS292
ZXJIdlpWbzd5RFpnM09PQVJxTVpUaEVnb3JCZ0VFQVpkVgpBUVVCQVFkQUdHZDhVMnJyaldxMVBa
YmhsQUFPUE1KanJEeTVkSjdMbnQ3ZHE1Q21VUWdEQVFnSHdyNEVHQllLCkFIQUZnbW94bE9FSkVL
a0h1Z2g5NDhLb1JSUUFBQUFBQUJ3QUlITmhiSFJBYm05MFlYUnBiMjV6TG05d1pXNXcKWjNCcWN5
NXZjbWNVbzFQNFhTZExyNEpzRlRBaThTcUVDSERDa2thdTBtTmthSk5aaWFjU2p3S2JEQlloQkpr
aQpKR0RUSS9ieEpVU2dhNmtIdWdoOTQ4S29BQUQrZndEK0lLcStqbUFKZytYbmVXT09YNHA4eTFX
K0dYN3FTQzFCCnE4aUFYUWJpa2VNQkFLdHc0aStPZ2VHTWMyOUxHSnNIellXbVJhRU9nS0JvOEcr
UklhK0ZUa29GCj1rbmFrCi0tLS0tRU5EIFBHUCBQVUJMSUMgS0VZIEJMT0NLLS0tLS0=
--03531655d452a23f3d2b42a26f8811442dde937d3483b851835f9576f9bb--

--------ac8cebf76cc1a65a6236cfda853955e800f0ddea014ff94d2aadce5300a58944
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wqsEARYIAF0FgmqEx9IJEKkHugh948KoNRQAAAAAABwAEHNhbHRAbm90YXRp
b25zLm9wZW5wZ3Bqcy5vcmcjY7Yg4g4nT38AOeijBlwhFiEEmSIkYNMj9vEl
RKBrqQe6CH3jwqgAAIA7AQDkpXMF+oZx3gxUXV9vhJ//hjJnMzDxT9WZhLOq
YJC3kgD8D8h3vJBLznju/XWKeyL8TBA66YC0Jdi3UQt7PmZrSQo=
=rcnS
-----END PGP SIGNATURE-----


--------ac8cebf76cc1a65a6236cfda853955e800f0ddea014ff94d2aadce5300a58944--

