Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793874547;
	b=N2yPbFU0hp1owk3cL4Th7vimvay4Tlw/TGXhfcRvHTD1E7LxPirkwrC0FOLshXdskNL1
	 IqgIivngsA6k52R//rIykWETWxqfPV7MqK2zhoBiou30eg7Nli5EUltQTNrltJCyp9fKc
	 WfcO0rleMa3wF7wVHbdO+EApSw7pgwLEYSC8ga+lJqk6E/ramvdbehlsKKjDUqaI5q5qo
	 kdPZToK01hZbKQlmr5f5fByIBaN8yMxTHC2dPnsZXfE3OO1PpocQ2k74p9v8BCJ3QbrQv
	 FJUraorvRY8oq+i7A8aZDEQQMVcNqRpeIOj7LFFpLrQqOOpdcOtIfRKV2KP5BgUpz5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793874547;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=lzDU21F2EHLB7rOP/VYbDq+2X8MhT5hkKO20Bmq0VFU=;
	b=HEuxIHGAU69YfydTVdXXcHQJ8mR5O8cX4vqL+jQLoSgPYvFgRTBJgyNdw6rcQUPkGXGj
	 YjxCOiNTQYSXKqq2VTOSHtmqc9Jl9YCvgUbgZDriErIPP3HzR3AmDNQFac6aqenMvkWcq
	 VMPeWwhUN8mDXifJxklIdsKR4Z+5Q/k3QI1iu05st73Xjugkvv3uz15/Jnmrsk7AeuxXU
	 WgrbrLXo7Sg4sfMP1h0YFwf7LoyiVfrKhA4VhDsRWZssF23Onn7733LhM1w69E5MvW4ob
	 u42HnPR3x16Gc02tRHCjrPG54vScrxYwgUNAOnlQgx2aw3Vuxx1GVGnX3eR2faxM36w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b="a/6um+d0";
	arc=none smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7585606EE8C
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 10:29:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7585606EE8C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=a/6um+d0
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b1d8944cb0so2693796a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 02:29:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1793874545; x=1794479345; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lzDU21F2EHLB7rOP/VYbDq+2X8MhT5hkKO20Bmq0VFU=;
        b=a/6um+d0uQTISqAYWjTSS9HtqKug8rg9E2rLH1wkEJ1y4a735hhrmhCOCiwFHxJ3nq
         A6zcqbb/g9Cvv42ERK/gzGNhSpFHNnP3IaxS8FusHfvgiVP5qUxfyDvsmsyN2dl8Wefu
         VckCYwBXoSy9paRds05qrzde8Csv1gyyZSxsRpcSxK9cAn0AAWc2SNpBRxBIuckufczm
         UqU4cZODqkx7b33OgQ6E/1hs7Blozqhb7/xi3/1GtZ9I8dS4qe8Z7m2EHgUxSLW4O6xA
         iqTHsyrS3gW5/HJxkGiV8JwkUV46y1WBvhA4S3tjiqgwztJPNW39oEQZKY0s7NRUH+rn
         Gs3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793874545; x=1794479345;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lzDU21F2EHLB7rOP/VYbDq+2X8MhT5hkKO20Bmq0VFU=;
        b=va2sOeDBwjmmsD3kH+nVqI82JfKhfO41gQUdK4iWO38BRWN45h1HBrEYJE7wj5e1cw
         YkoC7L/XCl5XKGK4HiS1OIxMpgboWI23IH+SfTcDig/x9fYXJ6zNFDPxdaTxWaFyLP5J
         q1SvqyZ/8mJ6V0Lpd2ZmMDIp+8eFZY2DaTM1YFZ4JEH68gbfbncmX7RCr53NULFZYqU8
         5H+rWFUTD6kioqig6Nsqa7HrlPNj/3uM4MPV/mbphiC6in/Th9X5VHtp01l2gvjfZq01
         8PbkM38Aqz2jBzpGEU4GigF4B18hrWVOkS9SITvnGzn06FHUvIKw13XvQwFQKiYWORCP
         84VQ==
X-Forwarded-Encrypted: i=1; AKwUvBxsBEGfaER7awBwx3ynJ2YgcIxqcku2AlSGsDCp9BU4A8Nccb1uIS72LVrnq3tVffbLk2XuyqfetvwHwmPM@vger.kernel.org
X-Gm-Message-State: APuU4Z/lAb/j+NserHzFXKE6cmCGdWbunCXa3oY3Y7hyk1/pzCGG4AAw
	7RGp62YClAQc30nGe0OMQawlmKL9bvDoLuNcK0+6n4+03IOm9srrLR6W5T+NyvR42vI=
X-Gm-Gg: AYBFou20pklbyBEjykUT3yBe+RNWf2KOQrCjDhQZWsoZnWbL6tqIh4iwaZ5e0LQg9a2
	3kN/tjfMHxNe+oCh0CMqpg6etJPpeqYDoeRrqL8aASJYkbuDEsequCbprRuOBNkm14Yrkk5+3i3
	TZgc5IJEnQgYeB7lvYkP5D+4W1qUvLkJr+bSXtLOxuQt7AwE6FYV5jKYaqOQlLahK2kKJeGpsFS
	xk83u/jcmXn1u0kI7CQdvghaTixJDojay55EacicX7apxu6qKm5tIpVPlgHuG7ryENq9sSlS5fs
	LlN0RpcGmIvWWghY1R6HfShNl1JPYA+rYC1inRqLzNospeSBD/shvAMgZE6RQByeHzKRbAjofXY
	rqJ0V6LAQ8LtTfMeMeAredi0dLbRqRDM1jsU34HTndedUPKpW/e0Vm86LljdfqSWGFsZsTuwmM4
	kCmOkTs784cgLVcdynYsFmlH3OqBcbUn4xYFqQ3Sm1kdS0/xooq1MdEMHZ8GhUEW/P29H4lqs5Y
	r/XATBdsysVfa/Ric5fTgDkl0kmM4hYHOOvBi5QqwyCtgJ7h6eDIOnEPmWtwZNVeyNSzSoaZgvG
	WCBYWh3W7NZbxEqZGrDQWpJ6UfkPdqrpTJVn3bC6qTu95RoBGsLVGHVgEZhp7R3mH/LcC2yXFaS
	30vk6iDCGEQc=
X-Received: by 2002:a05:6402:2b96:b0:6b3:bca6:b480 with SMTP id 4fb4d7f45d1cf-6b4d65a8fb5mr13928684a12.44.1793874543883;
        Thu, 05 Nov 2026 02:29:03 -0800 (PST)
Received: from [172.16.220.224] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b5864a87c1sm278665a12.2.2026.11.05.02.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:29:03 -0800 (PST)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Thu, 05 Nov 2026 11:29:02 +0100
Subject: [PATCH v3 3/3] arm64: dts: qcom: qcm6490-fairphone-fp5: Fix
 DW9800K support
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-b4-dw9800k_cleanup-v3-3-6850ee6a5a5a@fairphone.com>
References: <20261105-b4-dw9800k_cleanup-v3-0-6850ee6a5a5a@fairphone.com>
In-Reply-To: <20261105-b4-dw9800k_cleanup-v3-0-6850ee6a5a5a@fairphone.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 stable@vger.kernel.org, Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793874541; l=1266;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=mcLSV3KKUJrX2Vt1xs2+yh4YAv9r2QOuUzb8TrvhqBU=;
 b=ijW9VPm7EHX86RDK200oj2lBmSMCAHlv42lvi+mFyiDqBGXFEZsOlxeuP2TZN1evalrtRLzuc
 zQ50VXLhpNbBVipwIcRAQN4VF/7J7Tb8Z9rXnYHls9BF6UrdAHwp2sx
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=

Update the node for the DW9800K for correctness.

Now we correctly select SAC3 mode and enable timing-control with the newly
updated device tree bindings.

This is a breaking change for a part that was previously functioning,
but only due to manual register writes in the driver. Now that we have
the correct documentation we are able to update everything to ensure
functionality with other devices using this part.

Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index f41ad446a39e2308abaea68a6b31a7e387881bf2..a657a5dcba9cdf750fab2478ca319f3a592ea295 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -665,8 +665,9 @@ camera_imx858_dw9800k: actuator@e {
 		reg = <0x0e>;
 		vdd-supply = <&vreg_afvdd_2p8>;
 
-		dongwoon,sac-mode = <1>;
-		dongwoon,vcm-prescale = <16>;
+		dongwoon,sac-mode = <3>;
+		dongwoon,vcm-prescale = <0>;
+		dongwoon,timing-control = <16>;
 	};
 
 	/* IMX858 @ 29 */

-- 
2.43.0

