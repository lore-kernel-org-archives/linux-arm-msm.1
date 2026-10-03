Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D520C49E154
	for <linux-arm-msm@vger.kernel.org>; Sat,  3 Oct 2026 17:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791050230; cv=none; b=qwpC15w6d9T/+myH1m3hkelzmNcZ7eneYEGi6ZEanrY/m8Kqb9+Qfq2QIZuUKrFmDrFLivtg9yMU1f9YGfhi49w2b+o312p1P2CWOXtAtD/pjJ9IZdRJyu2n68qhVoquzNpjwwaGIaq1pRJKL1LhQ/zbaMoc6HmVwRNOj/MtFp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791050230; c=relaxed/simple;
	bh=E3tyehOB9W9Nl5Yzv6CfUNAfqt/mgkcRmqeKsC2PjQo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y46gYDRpkWjlpJMXBR92sVODCYxQxfBaav1qGoUDI9NS269iqLdaNeX3qUbSTWdOkgzAoVt4dGBkrI6ijk1jey3GUsr1tMZoeyN7VJqgIT7wwORemKV/Qxv8r4zQzAMOxykCqH8FMhlgWmUwUwJCj907A+aVa/5rECmLagHE91M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kEZGQzCT; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kEZGQzCT"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-93e5f819884so14247385a.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 03 Oct 2026 10:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791050227; x=1791655027; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vL3sTY3IXitdlnsmUfvR9Xp3a/Fbw5FtYRtALDNoULo=;
        b=kEZGQzCTESpYFJNvGfSXIZ/wqWtxmC/VgLMeAN4s9F2TQIEacrwlkc1rxANW3aU7W7
         bcO5wEz74ImnfjtCOhlElEy9QDyATLOP0H4YR3cUSz1zaCx3nnEcT9WALApMfvE2XevM
         6Zqe3bX1ogA0ppM1s0FkpwT7R4KHoTN1zCSewGrtGBuPK/1OCl13zgus3brDiiY7Duct
         koNLDlmbk6idk2lGnXol8gIKuDxdbb9347pQx3KWowt3WmKtOUVhUCn5WHnIisp3z5th
         L9CTKhvliu4CF3FY8XFnDX+PNkWA/eQJ/I73RZgQ+u144RiVa150qjrtV8Sv1Tt0TZ1m
         q7PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791050227; x=1791655027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vL3sTY3IXitdlnsmUfvR9Xp3a/Fbw5FtYRtALDNoULo=;
        b=AvZCoVVJdZRakiTGUD7U2lanaQLqmMNwwTdEWFdLVxORpyw6fEhoFHmMcA6boUPl/3
         JT/YY3OucKSk4bAOnjSRpHPEteO9xMLshRY7j5GkCHmw+8BxmJSdL4wHjq/ULbHDybGm
         86zc+xBFDpEoQgKy0HA5iWAp7VIIGg+bL/qPKipF39z4PLMZhOAIXOIx0Wbiog+O4E9V
         KXAr6QbeMWVIeom5d29Hxptuoe3pH1invDV3pAuVq01Zkg7Ptbr1TYzvOr3mnFiSUdlw
         CkRSX9Nr3iSH+oJKdMeqlcNmzSeVybCgqHtyHIUAXJGYsUc13hjC3GismEGIIgIhfBe2
         qQMQ==
X-Forwarded-Encrypted: i=1; AKwUvBylmct29OeVLCe2BPzDx8joqX7EBYqhsIkJ2gTnl5BMtoL+1Xb5BIYvD5Nl3tXbz8rwTBCvWso7e7WE4+Hw@vger.kernel.org
X-Gm-Message-State: AFuF++k8m7OySZ2q4zediqFM5Srdg7M9xJSoXkz0HkLZL86vEvw5/oHU
	h2aPPFKOBZx0Be1i9AfbtG8exWnvkSY9pLPI9uchDk4jawrr5HrVaf1dHVEbRw==
X-Gm-Gg: AYBFou1OyU6QufZxJndZW6xSvTL5hnafUIIu/7hjPtLYoqKmz5Mt0DtP1Lt+EJD4XrV
	uE64aK4ixSYbZGhrACfs0+sLhnBnXx1oPOq6J96+AYR7OEGbbwxzGUcF7m9eJCby0fTTxLfCv4y
	7wwAHdmkqtJT/cXfHjH5ZAGs/sSlPZ5+1v5FnYQYw/65+XNhA+BGZXd6C/9GojJMlUvJVZDOG/7
	HOQeizKuG846rfnllsSTqkXpaQwodYV/zxb/6Cx3BQNUVPLOSVrphv4eqRZboJGDYQiG9+SAtRJ
	Bjb3InF+xjFxZuXxZ+flRyVxWp4Ik+clC3KSEbLybceSg+ln+kp9G09LKHm6yk07EWjWEUh/rlY
	cpzya2Y0189PFfVpwGoXHSPkK5yLL+iURQ53uKPFFSdZuYg5nXPMysNyFCQFx3NxUCfgFpBP0Ly
	NpIb56PP8R7UDNWxe3SNHKzmaxQUvtceJYWAJBDLZXiltKvrd45JEsJcHIWjSyS3WH52aApMyF3
	Q==
X-Received: by 2002:a05:620a:28c6:b0:939:13a7:70f0 with SMTP id af79cd13be357-93e50e08351mr557059385a.5.1791050227622;
        Sat, 03 Oct 2026 10:57:07 -0700 (PDT)
Received: from localhost ([142.181.121.230])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93e4e5b8c55sm283382485a.16.2026.10.03.10.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 10:57:07 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Jassi Brar <jassisinghbrar@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-sound@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v2 03/11] dt-bindings: soc: qcom: aoss: Add compatible for SDM670
Date: Sat,  3 Oct 2026 13:56:51 -0400
Message-ID: <20261003175659.23536-4-mailingradian@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261003175659.23536-1-mailingradian@gmail.com>
References: <20261003175659.23536-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the compatible for SDM670.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
index d2ae2ae87a95..6672f441c20a 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
@@ -43,6 +43,7 @@ properties:
           - qcom,sc8180x-aoss-qmp
           - qcom,sc8280xp-aoss-qmp
           - qcom,sdx75-aoss-qmp
+          - qcom,sdm670-aoss-qmp
           - qcom,sdm845-aoss-qmp
           - qcom,sm6350-aoss-qmp
           - qcom,sm7150-aoss-qmp
-- 
2.56.0

