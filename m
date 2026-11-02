Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793627829;
	b=Z8kbB9eCbjeR20ZnDw4475NUPgUKnmKk8C6+RSzV3qXJSMH5g62PW6eKy4JNH+V8Be5F
	 6/MNM9ELbQ62kfg+cXHUhumRJOGWuQpKLROHoLv8H0wEnVgDCrzS5p8TeoKDdsDen3v85
	 MYj0tLt+Q1X1TfeD0lBbia5hg370gZbaYX4lB5OY3S2H2mu2njt6t8w+NDE3jsA8orAC/
	 x1iihLwJWPqBk0WPxOOIp/JlAtVZVL603MyioKvWSQltkwlTtwApWPIbaC+AZcE9xciWd
	 I+gKmQTzpoWYFsqPG3TuISRoYZJMZTZc4JxszayL7txfJE9hqW6fHrBAdmrcdVCc/oQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793627829;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=/G+GoCszj8uMGdIOWBMWwoyuQ6G5HkG8rRZwTC2uNlE=;
	b=x8BwMZh6rtO3uDTkg39rNm94+mlUSwESUzY5hcgK+Gd6XsNnVwJ0dc0kxZkvwY8z4ePL
	 Olxf5+0z+t92CS46pEUAxmHu4w4WLms5gGoRCAU9m7sUFjoqsZyhD5ssOLqVQshV9Z4QF
	 WJWdrLYQYMdjWbspbwziApIGBlt2Jdp049mhzt6IkORJIuSpCu1V2h/Ua+rkIq9l8V3U4
	 b1wprFwYbg9eSDOOXg3Q4bYdOQh1jRQwrGY6npJG9MeRkimWsfHDFfeAJPWY55Zw+Xrua
	 C7mYkqt64NTfAgzQZy37+aGSYrjGpJ6BJ7kIjJsag36euWOLQmdVXi18bIVmS+s/FkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ERVvzQCu;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41A960A5BC2
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 13:57:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E41A960A5BC2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ERVvzQCu
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48dee593f18so2917037f8f.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 05:57:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793627827; x=1794232627; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/G+GoCszj8uMGdIOWBMWwoyuQ6G5HkG8rRZwTC2uNlE=;
        b=ERVvzQCujfWCjYJN9oYZKaimgac+b/IzEOZnWk5PWe8LT/M3Zj8G/TB5fBJbB0hg3J
         6GBygHtOkJCd7zq1FGVNAOfShOPcweyQm/QNiDSRVXDsAbruG251NUfmpPOudJqndX7l
         JaIgdJz8CJXqKeOvMvuoBLZAvf15aP3Pw2CAXfVTKSvIxheUlkmuLoDHFc+pfaCP3pbI
         Dp44C0MKPPNq3VtqcM2bkdaDqCv5f0P7oQSlqMcdxQIzVzpRYZwyo51I4XSTf7IUiZEM
         PJo+08xy53lH3cp93x9MZzGdSYp0Z78heb59inAqdEKV4tdNSv3dECPCugLN+VqTgiOz
         hpyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793627827; x=1794232627;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/G+GoCszj8uMGdIOWBMWwoyuQ6G5HkG8rRZwTC2uNlE=;
        b=gAPwWtAwecgNr7cU6sWKcurklP1KZruTkbEb7WDOtc5CwIW5dC6z27HGv51MCJ+vwr
         ZWeIdILGGLXLbxli4YpdbE69dAPqNm93G/Y/rgFw22aA8vWYFmsc0BrMwCtzbgyFbvRf
         2Z5gS5TnhtBVK1KYnPSNlcXMYaxNRa6nmlF13/snsA7Tbf99yCXK4PYpkHws2Smno/VT
         Cov5Kh5c5lZyme4L4Np65FW2+xnofVGe7GPWAzAJQV4fSbe3vcgUNY3X9YD6ZaC9cEnj
         Hmzb3oIPWcSp615+TiNGLQyO+OYYvUR6Rze5gHF4/Z3NSor0bwU6TJFXlP6k2oxuqwzE
         nZVw==
X-Forwarded-Encrypted: i=1; AKwUvBxTknfCXmCAYfU+mhmybF9H6hV8ofYObWWEhgucPjLn7JADYCwUpT6uTV77T0cTHbeQngMbruoxS1xdHfww@vger.kernel.org
X-Gm-Message-State: AFq9FYKouJTkIOtTtZzqtcWk2y55XrO0W8s5KltF0dlZCBr7CbA2SKhg
	r4hnpmRmcBegSdea8ztO37i5hlgMLbMC5iZnmSTpqIwu0uBbB73CgyCSSbfbEHpAa+0=
X-Gm-Gg: AYBFou3UOT4/mM3fwjpnVy02HBqXB4QRGp7H/zc9g44IPyUe/xymXKVc/RpRHNPQg3T
	j/iSmX99jOxPKfgcGPL7rjenH6fwyPjWD1h3AM0cearPlph8vWz8k/eTjTWXqV2RrcL4CbkwrqO
	pIIghQsHnmQDe+v4ot5kG9FMkTtwAlYsXiPb0oXUD0LXgGUmhHRpKcBxvZLKHCiBsq/iDsM5Tae
	QvNXCQ3ijzm1t6g5cHLVvR700cTLaqDuxI+2wD3OCPlUD164dZJ0SykLXdAKHlU9OWpImBiPFnZ
	MDkzBGqXCAFZkB76CP1fx7PRtTyTw7vfona4mAhJU9JT4RQOugJ87+YvxdMc0WsX4B2rY9OGhIs
	2pcnXWIlUk9n4786wUIp66j5wsgLE6Ckn5ST6btJA1jSZjxLH+uBOpfvQltE3I6cEe+Tp7hYX10
	UCVxwoaqK4HGjm9gZlhbsQQjmfahC9VvCcN+ae2WKWUNHXOxi3gzc0aTsWGq+wiBOIfwYNOvfnr
	4ndXmmbcywgjNo5fcp5cmFbq1Q7JuTOQiL+biszfPsPufYml8DJZ9itEZ50XZbcOBXjnbufQxs2
	YDg8HQiImoDABA/c+A==
X-Received: by 2002:a05:600c:c48e:b0:4a3:2f35:38b4 with SMTP id 5b1f17b1804b1-4ac16bc4829mr238745425e9.10.1793627827311;
        Mon, 02 Nov 2026 05:57:07 -0800 (PST)
Received: from [127.0.0.1] ([64.43.42.35])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abe77053fesm126145375e9.0.2026.11.02.05.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:57:06 -0800 (PST)
From: bryan.odonoghue@linaro.org
X-Google-Original-From: bod@kernel.org
Date: Mon, 02 Nov 2026 13:56:55 +0000
Subject: [PATCH v2 9/9] media: qcom: camss: Switch on frame_sync_en for
 csid-gen2
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
Message-Id: <20261102-v4l2-frame-sync-v2-9-25cbed7a772f@kernel.org>
References: <20261102-v4l2-frame-sync-v2-0-25cbed7a772f@kernel.org>
In-Reply-To: <20261102-v4l2-frame-sync-v2-0-25cbed7a772f@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9253; i=bod@kernel.org;
 h=from:subject:message-id; bh=95tDSJ0WVTpznjgi65qW2It4WcwY5sqHJM/UhObBuA4=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBq6JanjOXo7wPWoBVwARpvmig8hyXcQmRwDsUrp
 AGom/wng62JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCauiWpwAKCRAicTuzoY3I
 OsqUD/9N741GnuBLpdtxDFC1YqjL8I26xncRsE6hQRvCKzjGxc1N3q09pfMWpk6a1lWSR5/kz1n
 PmZzct+XJdaeC9VgBk4SKrdbdZJ4+nvMnhtVdrFZGDWn6uTH0oMBavhBF05MZmnJ4deTHWuTASx
 L4gpEVMuTBLwBB4Ahfyt8tmIgXYTAx9mDOQsAKvMsvsIabTGNrbD3tFcaWJDGNHSZ5j9lBeVQ0j
 KY6eYxEVlC0ii0qMZqFPn07mChY/slk1bcnZV0wgYQZmplY8uGKrwKmh0hrIoqIsl39JNzoJYlQ
 fEIE5e+oTHfEmkIV8bXfALiLLJ0su2o5uyK5khQxK0qid7QcqQPTtie3Zk76g5Vvwrz68igUxqL
 awG8yUcjhVfVWWkvppYj8SyHtosSiF/V5X4iSYw3GaHqOnjTpg6HtiLJuf4OTN2Gnu0VjOj5bnN
 JZKgEdgAdkp+AYsRhIMq22euR3WfEeY8A0xuBMqaaUHpKpnKt/md2GCOhDVUvbYZnVV1sPf7mM6
 4V/U2fgMd+vv2xeqop9ZTrIFp73/aE7adziN/0t865nef09YC277AVur9/uPwA371RVN+H2ezpJ
 rdRBKjlSdFtXNfNmuHV5UG2T4iL5BJg4pZVG5T9WqX5uSZs4MiNQBmO3ikBl+7XqLJ09ToEkHhf
 wGzkq8UGa7zeZyg==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Switch frame_sync_en to true to track and consume SOF/EOF data.

Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # rb5
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 7911b30494ac9..bfff28e789b04 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -1132,6 +1132,7 @@ static const struct camss_subdev_resources csid_res_670[] = {
 		.reg = { "csid0" },
 		.interrupt = { "csid0" },
 		.csid = {
+			.frame_sync_en = true,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2
@@ -1151,6 +1152,7 @@ static const struct camss_subdev_resources csid_res_670[] = {
 		.reg = { "csid1" },
 		.interrupt = { "csid1" },
 		.csid = {
+			.frame_sync_en = true,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2
@@ -1170,6 +1172,7 @@ static const struct camss_subdev_resources csid_res_670[] = {
 		.reg = { "csid2" },
 		.interrupt = { "csid2" },
 		.csid = {
+			.frame_sync_en = true,
 			.is_lite = true,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
@@ -1361,6 +1364,7 @@ static const struct camss_subdev_resources csid_res_845[] = {
 		.reg = { "csid0" },
 		.interrupt = { "csid0" },
 		.csid = {
+			.frame_sync_en = true,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2
@@ -1389,6 +1393,7 @@ static const struct camss_subdev_resources csid_res_845[] = {
 		.reg = { "csid1" },
 		.interrupt = { "csid1" },
 		.csid = {
+			.frame_sync_en = true,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2
@@ -1417,6 +1422,7 @@ static const struct camss_subdev_resources csid_res_845[] = {
 		.reg = { "csid2" },
 		.interrupt = { "csid2" },
 		.csid = {
+			.frame_sync_en = true,
 			.is_lite = true,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
@@ -1573,6 +1579,7 @@ static const struct camss_subdev_resources csid_res_sm6150[] = {
 		.reg = { "csid0" },
 		.interrupt = { "csid0" },
 		.csid = {
+			.frame_sync_en = true,
 			.is_lite = false,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
@@ -1588,6 +1595,7 @@ static const struct camss_subdev_resources csid_res_sm6150[] = {
 		.reg = { "csid1" },
 		.interrupt = { "csid1" },
 		.csid = {
+			.frame_sync_en = true,
 			.is_lite = false,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
@@ -1603,6 +1611,7 @@ static const struct camss_subdev_resources csid_res_sm6150[] = {
 		.reg = { "csid_lite" },
 		.interrupt = { "csid_lite" },
 		.csid = {
+			.frame_sync_en = true,
 			.is_lite = true,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
@@ -1775,6 +1784,7 @@ static const struct camss_subdev_resources csid_res_sm6350[] = {
 		.reg = { "csid0" },
 		.interrupt = { "csid0" },
 		.csid = {
+			.frame_sync_en = true,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2
@@ -1790,6 +1800,7 @@ static const struct camss_subdev_resources csid_res_sm6350[] = {
 		.reg = { "csid1" },
 		.interrupt = { "csid1" },
 		.csid = {
+			.frame_sync_en = true,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2
@@ -1805,6 +1816,7 @@ static const struct camss_subdev_resources csid_res_sm6350[] = {
 		.reg = { "csid2" },
 		.interrupt = { "csid2" },
 		.csid = {
+			.frame_sync_en = true,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2
@@ -1820,6 +1832,7 @@ static const struct camss_subdev_resources csid_res_sm6350[] = {
 		.reg = { "csid_lite" },
 		.interrupt = { "csid_lite" },
 		.csid = {
+			.frame_sync_en = true,
 			.is_lite = true,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
@@ -2058,6 +2071,7 @@ static const struct camss_subdev_resources csid_res_8250[] = {
 		.reg = { "csid0" },
 		.interrupt = { "csid0" },
 		.csid = {
+			.frame_sync_en = true,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2
@@ -2075,6 +2089,7 @@ static const struct camss_subdev_resources csid_res_8250[] = {
 		.reg = { "csid1" },
 		.interrupt = { "csid1" },
 		.csid = {
+			.frame_sync_en = true,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2
@@ -2092,6 +2107,7 @@ static const struct camss_subdev_resources csid_res_8250[] = {
 		.interrupt = { "csid2" },
 		.csid = {
 			.is_lite = true,
+			.frame_sync_en = true,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2
@@ -2109,6 +2125,7 @@ static const struct camss_subdev_resources csid_res_8250[] = {
 		.interrupt = { "csid3" },
 		.csid = {
 			.is_lite = true,
+			.frame_sync_en = true,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2
@@ -2349,6 +2366,7 @@ static const struct camss_subdev_resources csid_res_7280[] = {
 		.reg = { "csid0" },
 		.interrupt = { "csid0" },
 		.csid = {
+			.frame_sync_en = true,
 			.is_lite = false,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
@@ -2368,6 +2386,7 @@ static const struct camss_subdev_resources csid_res_7280[] = {
 		.reg = { "csid1" },
 		.interrupt = { "csid1" },
 		.csid = {
+			.frame_sync_en = true,
 			.is_lite = false,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
@@ -2387,6 +2406,7 @@ static const struct camss_subdev_resources csid_res_7280[] = {
 		.reg = { "csid2" },
 		.interrupt = { "csid2" },
 		.csid = {
+			.frame_sync_en = true,
 			.is_lite = false,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
@@ -2406,6 +2426,7 @@ static const struct camss_subdev_resources csid_res_7280[] = {
 		.reg = { "csid_lite0" },
 		.interrupt = { "csid_lite0" },
 		.csid = {
+			.frame_sync_en = true,
 			.is_lite = true,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
@@ -2425,6 +2446,7 @@ static const struct camss_subdev_resources csid_res_7280[] = {
 		.reg = { "csid_lite1" },
 		.interrupt = { "csid_lite1" },
 		.csid = {
+			.frame_sync_en = true,
 			.is_lite = true,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
@@ -2645,6 +2667,7 @@ static const struct camss_subdev_resources csid_res_sc8280xp[] = {
 		.reg = { "csid0" },
 		.interrupt = { "csid0" },
 		.csid = {
+			.frame_sync_en = true,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2
@@ -2664,6 +2687,7 @@ static const struct camss_subdev_resources csid_res_sc8280xp[] = {
 		.reg = { "csid1" },
 		.interrupt = { "csid1" },
 		.csid = {
+			.frame_sync_en = true,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2
@@ -2683,6 +2707,7 @@ static const struct camss_subdev_resources csid_res_sc8280xp[] = {
 		.reg = { "csid2" },
 		.interrupt = { "csid2" },
 		.csid = {
+			.frame_sync_en = true,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2
@@ -2702,6 +2727,7 @@ static const struct camss_subdev_resources csid_res_sc8280xp[] = {
 		.reg = { "csid3" },
 		.interrupt = { "csid3" },
 		.csid = {
+			.frame_sync_en = true,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2
@@ -2720,6 +2746,7 @@ static const struct camss_subdev_resources csid_res_sc8280xp[] = {
 		.reg = { "csid0_lite" },
 		.interrupt = { "csid0_lite" },
 		.csid = {
+			.frame_sync_en = true,
 			.is_lite = true,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
@@ -2739,6 +2766,7 @@ static const struct camss_subdev_resources csid_res_sc8280xp[] = {
 		.reg = { "csid1_lite" },
 		.interrupt = { "csid1_lite" },
 		.csid = {
+			.frame_sync_en = true,
 			.is_lite = true,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
@@ -2758,6 +2786,7 @@ static const struct camss_subdev_resources csid_res_sc8280xp[] = {
 		.reg = { "csid2_lite" },
 		.interrupt = { "csid2_lite" },
 		.csid = {
+			.frame_sync_en = true,
 			.is_lite = true,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
@@ -2777,6 +2806,7 @@ static const struct camss_subdev_resources csid_res_sc8280xp[] = {
 		.reg = { "csid3_lite" },
 		.interrupt = { "csid3_lite" },
 		.csid = {
+			.frame_sync_en = true,
 			.is_lite = true,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,

-- 
2.56.0

