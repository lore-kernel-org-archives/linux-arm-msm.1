Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794013328;
	b=MnnUsKp0aodz0v1bg7bCgjUWPBfD+4+afR3Udk5l4mEuKC8euSi0F/Zk71lbGrqQuISX
	 xnowIXE7637c9yYKVbPe2AnUYRKy86ldQW1MA3MQ0UPg44UDrbwDaS6xBapjOveFFt64P
	 rAcsFZmGynKibq86zk5SS1/jZC70DWCglvZIHRjIqbS/DqyOjE9NDCC2WcM2QlujsJQvA
	 w79YGqmHid+CZChyfnOGDu8puXG/tFyoDUPKr8XaYN73cgvWfOJ6R7mDB0W6rMivbXW0L
	 p+zF0zxspJA6rCeZVPvrkkAFvxyQf5gzcbwT4gwvsnx5Q5FoFuibUNYkmDKYzyFeVkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794013328;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=pk/3CWE6bTvPjpMU+QpkcG//CRX9jmwJSAKem9wEU1k=;
	b=o7kaoMjOwMmVcWPKXetsc6SUzuy0/KIVqZycKaV4xukJdoUv5Wjar1cDi695zmIlqxss
	 X3/UY6dUnx2C5wjaiVeljgdsYUoNlXkkbXulAXbBn4uTQ6BOo1C42qxhB870jrCUkWpnK
	 enTIpHvCQTWtJydrKEhzBBSiQJI+9qETgPdyJ3e4tuJTZLDop4Diw5sWonLXmWmC2v0K3
	 qV6onVti4tARHaJ/CEtFWsGv7QkwXXQkyYWuGAOQwpyPSMWsQCNaOKXDaMWz86w4fHDGW
	 pNcHGB8VIHKYL/qNRiRc9SNdDI7liZuzo4W/TymIt43pHms3706A4o2geF4jDMAYp5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=VNmzae8R;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84546606D816
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Nov 2026 01:02:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84546606D816
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=VNmzae8R
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso11342345e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 17:02:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794013326; x=1794618126; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pk/3CWE6bTvPjpMU+QpkcG//CRX9jmwJSAKem9wEU1k=;
        b=VNmzae8REI2HPI6EFUlbwm9X3pH1Icg8Hk9JT6RmEASuZy81BlxKDWIWMJZrjbMeTn
         foOMEeb2gvtoIGD/em5A3MS3Mrdw6pm1N2J2o1hH20ykhnqntBtpWtXQ+dpFesAs7NtQ
         GVi8KuZj5jeTa7QKIXPo8GWi3FF0GRhXvsVt2XViIQM2xxyEt57LcaKsq2WmoiF2H9hF
         hFVYOrIGGDxXk9tXX72xYGsG6pFCJ3VPWxeqPcjAjjdojRE1V+VpCeyzfo1VH9geCNpP
         25U5KYXMpHb3MEaTBD7xfsM9Ttx33cKgK/6Y4kQ8D50zFzBmyzKfosObNOi/71jwk+VL
         bg9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794013326; x=1794618126;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pk/3CWE6bTvPjpMU+QpkcG//CRX9jmwJSAKem9wEU1k=;
        b=jB1JWdzJYOFFAcXXtIvVAC3fPNeUigJCaOHgv3ik2mLNOR9eSTJzKhCsVWdHf8XSU+
         aarlynSbmP+FB9JJbOwU/hqiFxAquffh525OYv6/dk9N+2N4Ny/nP9Dy7RPws4NDzkTR
         C+zsXctsROG0hvFQGXPrmQKAPZXsSNsVM7zyr4p0865cqU/d/XC0u44srwie3Rq/yDOe
         zt9XGaqWu/hL3WRU/2f3EcpP2vEwwRaUG2z2NFvo8MSbGkb04uaXBOYG72/llmUibcUc
         vpzS3gRAH+nkbDvJHW9sy7c+v4VmlGQJr+ZDTaWZEqCvHX6fM2bqlJpcobXLLxKJkzBS
         viXg==
X-Forwarded-Encrypted: i=1; AKwUvBzSb5HFhVatM+YqlzYwp9hj3MsfGnN/0Qj9PDWitLzxUc22N+BLtbj1okhMMJ9nGKgcX0DtPv9KhD6deCmB@vger.kernel.org
X-Gm-Message-State: APuU4Z8xaBvXSTxPMgjavUcRevP/ptUJ53FvUHwaAvE/A386Pcj7nvdE
	sSxpz4dmb/ysTdHCphhvXLF85Hp2tzMmWyts3phAP5awnuAQxW7P8hQ3RNOqh/ubkH8=
X-Gm-Gg: AYBFou2shXvORmsZdt3IkQIrUgGnMVk9Z8/YOZvYEbq6/iJ9jAeTgacboEct8YIimOe
	xlZ/547oqtIh753lQbVW3V4Fe2fnU+6K55BfSjK5TxxoZM64As0llgfY6wgFyrD0kqwbbP4G60s
	oW2Q5s5WaTF0UwYyfwJ3NNNsPtEj72FEHpEDCLLCLy4HZd3gSnmkUNPoIFY5rr58wZe+MWdc6qy
	3NU3G5pLQjhrfBYwHDCyJkULO2FErQiLTfe6iienKPtynwqtyzZBWs9b3B4TvHFLB9Uy1cIxOpX
	sI6BWCABOeE3r8FoP4+ZZyqcCJd/nwKS2SIZYXlluaj/Igu0u5dVXISIGAkis+FcWypoia9TK7n
	+wuCVIWoiQXh4hFDSEAcwK7PTNP94VxD00yz/GSBrV7Mzu/dqhoklDfVm5LTLThYyHnWFVg6q7y
	llOL2+E3NaO07YGz9A2hYEatfuGR5MeCb4rYO/WK/cS1ggg812HirOPJuYS7Rilb25enMLar407
	70Nq+SAKy8CzMwZvqTDEkPeAUTem1fuprFi4Xk4Ln04QCCkBiekU36dAqDCEFYxeYmxErNPLsBU
	JjaGbZ65C90hzkj3/RIJEQ==
X-Received: by 2002:a05:600c:1d1d:b0:4a2:1612:637a with SMTP id 5b1f17b1804b1-4b6df4f28bdmr70945495e9.16.1794013326583;
        Fri, 06 Nov 2026 17:02:06 -0800 (PST)
Received: from [127.0.0.1] ([109.77.115.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e3291531sm24526375e9.15.2026.11.06.17.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 17:02:06 -0800 (PST)
From: bryan.odonoghue@linaro.org
X-Google-Original-From: bod@kernel.org
Date: Sat, 07 Nov 2026 01:01:54 +0000
Subject: [PATCH v3 11/11] media: qcom: camss: Switch on frame_sync_en for
 csid-340
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
Message-Id: <20261107-v4l2-frame-sync-v3-11-e5bf7073a35d@kernel.org>
References: <20261107-v4l2-frame-sync-v3-0-e5bf7073a35d@kernel.org>
In-Reply-To: <20261107-v4l2-frame-sync-v3-0-e5bf7073a35d@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1104; i=bod@kernel.org;
 h=from:subject:message-id; bh=UApk8Y4wLDTQJN9GGeqd/uvucLZuS+qiJSOYGDtTUSY=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBq7niAk1vUQmBpHBSKgslQK/sbDuautKhYABgRd
 Uhz3oS3Ec6JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCau54gAAKCRAicTuzoY3I
 OlHaEACL7gyTPuBMwmeVHIim2sX9bwmUoOLTEi8ZAAgv5tPUHIBq0Vzu3VIZFRP1b5WhCr602fD
 F9OJAabkJuIONJ/Elaz0EKpVDVg3/uXjKEFAswmqOduZLD0kSPjelyg02Botl5TX3n0vctzbDfG
 RADgTEVulwl9741DBzAt3AAvQurzMPNcla6a1nQ1fyUOpGzPCLtRpNXPKQxL6gVrTU+XvOOfQD9
 yw3mrbRHAPt/4Cc24hH+HsjztEb2bQSmHi0ghWRpzd76dp+sdff1Wc/QECB6eE1LmQlV+ERs46a
 ov6whPcH8jSnqM76aX6ebOyQ9Uwjuozl99f2ycDx7+kmHJmN4POxe41JIPCvvWttq/s7XP/Ufqu
 tkTbWWl+Fx3drqpowiWbWYGoyYW9o07t2xE4zVEPBx9OJVt59o7IPMl1tvDGhdhIb5wrojOLKCh
 8MG8iPf9cp2q+IfrWUMMdBBfxLhJ8sIpU4Boq7QN0q4i3FdEYKaBA3Ft3pTp7fMabREXlb/wMiw
 uCl9BPhx7pd5En9jKTtv+egr9/Lyns46HWmbkYGF4XswDkDztdgks0lrous+1ZDvZX9TpAHI43e
 Crjg9oiSgb3aLDTh9nV4XtcYMLuZTkTBYzFOnDSuDbuXwxnx8bYw6ciSVt6HBkXpzPgEh7v5OTS
 Ffl40+5PbZwDLKg==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Loic Poulain <loic.poulain@oss.qualcomm.com>

Switch frame_sync_en to true to track and consume SOF/EOF data.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
---
 drivers/media/platform/qcom/camss/camss.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index bfff28e789b04..ac12960264adf 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -733,6 +733,7 @@ static const struct camss_subdev_resources csid_res_2290[] = {
 		.reg = { "csid0" },
 		.interrupt = { "csid0" },
 		.csid = {
+			.frame_sync_en = true,
 			.hw_ops = &csid_ops_340,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2
@@ -749,6 +750,7 @@ static const struct camss_subdev_resources csid_res_2290[] = {
 		.reg = { "csid1" },
 		.interrupt = { "csid1" },
 		.csid = {
+			.frame_sync_en = true,
 			.hw_ops = &csid_ops_340,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2

-- 
2.56.0

