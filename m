Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794018357;
	b=V4zGnpH3RiSLM3yguROgXJmJnqyNgR+5deJYdJQrWvaj3UBcpIARwQ2XljHwxC1xGgmm
	 yeryXbNN0qRQWNESYWzEv6xJ1HdwXUbVvF3sGWzRrFJ6oKPSnCMMxppzlugUKpoNmohSE
	 YcKFcUsul6uRJ72hf6VAVMBj1n7gIuAq9j61iPLGf8NcHxBixs8XmRZBxPwmrPWZHjm5X
	 7Hvn8qBf/7VAIwnqvG3Vyluaxw6wp3mAP9KNjsTnrHWnnMe2zTXkm1wQXybVfhgLPK12q
	 VsGRUF6w5PPq7m8iE3fJYoBxuhpQc8m8ubURBev3vxuWtbLnZu5CT82ItY/+FaFrJfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794018357;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=B3SGzHlgY8odIPc0vKXo4UyX1GU/XLl2ljqE7iQ/a28=;
	b=SD5sr16mmrkGCyWxfGcLVo/leJAFy4DpNcGc8fHANP9j4zRQM+Ynnh3nD68qGl8jhHyZ
	 J6uwEu++tNM6bSyOfwKucyPKktPxHPTrTzoqasEmqtXKy8h4eLgxFLw5D2cB3cztBJDZD
	 6Ljoel7Hk9opLMVVYOOULhXoNMqjpkNt7qja2ehXwZGAyV8r+msAUhX5Uuv+vT2Ms5Zeo
	 ydHf79KmYwqepRT2rpVaUz9wdIk93VerFM6zHulOEc/Vv/3MagaJUBulTRrZttDq2V0ht
	 ZPF8/z2bpHgip7T2htBLbvcMx5qO5beNMzvd0RMCcxzNCnWKMVBsA2G8BPwQlHFgvNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lTeLhHPm;
	arc=none smtp.remote-ip=209.85.222.42
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2466606A32E
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Nov 2026 02:25:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2466606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lTeLhHPm
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-980c4f5c921so371396241.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 18:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794018356; x=1794623156; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B3SGzHlgY8odIPc0vKXo4UyX1GU/XLl2ljqE7iQ/a28=;
        b=lTeLhHPmBNApRqmkaGG8d9jRp+H2mIbSGZn1OPdnd/OK8qL5F4IM8rppC2adeTD/b0
         FRKNJBT/jErzUjnpfmJaZeeV6QKbZYRaXB5k0ubAn01Nxvl2t4Wa8RbFQ3AdhhJY2Fzo
         Pg94g9hSwiJ5QVI7W583jGP1/fX6n0pTJ0MHLJSuIL5n4rCFRxBIF6yfYlFThAotdsiu
         NWqFRJ1YXzHNhFmSl7PvogYjMvNT3rVXoank8ZD2VKfe2BlUGI6pWsVTJ6lQ+Ff+JNk7
         Pxwm0vz+VynGt9wAWiWqyFh70PxDG59wWV1ntpiR+FJI0ygrAjDwV2oF3B4zMB4z43Zc
         5mIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794018356; x=1794623156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=B3SGzHlgY8odIPc0vKXo4UyX1GU/XLl2ljqE7iQ/a28=;
        b=YlGxzWDeqxgX8GxI+YACbOPVQMEpqRupbuQDblVP3BGDcDXwgJs4kwC1RYyERKchpT
         EhON2yMcHlpIIs+B85nV7RtCPFEa2lTpFENs/2hNKUa9eKYEkmHle4sCBfUYZPf7wsWQ
         poxi1q1OXnw0Wa2WQTz23tekUSv0pvQm1oJRnXzUY8JTKMgFbIbUsc5rHI0moUGDVQSD
         mvAvG4gcNXjY2wMjEZB1HGf1HWgO1T8DAtbwtBw+VySup+RxW5ELJncJZv2IJZLB8sl0
         7hrqZGW8mpNHvTZSJgcgClfxGz49AwBfsRfRSB9E6oeSy0GQaaOZiIctQXFRZMfTU8pf
         IRCg==
X-Forwarded-Encrypted: i=1; AL+hErGsmJToTCsVfVFCU8HIAbETMPXbWQ0F8tdX5P7HCik/tu4zh8H0dPNCFFHLkBV7btsuOW61dU8S4pF20wb/@vger.kernel.org
X-Gm-Message-State: APuU4Z8Qbvy0ORmAMnnqvEbYRH04OL9Zez3uiJ7aUP2f5pCSiqMPVgN6
	zCS9inmAVwhUPr2Dr6T3E64pJNUt/6actBhFjSbRTu7XjF3uJzDsmXtH
X-Gm-Gg: AYBFou1GeceJ7FaVOfdQ2ZD4Pyp2VUKt8npDeF6RSTNCxcKuKCPAakLdd4rU/yJax6q
	/Oh3K/OuAPT7rzzSr7pT1TXlbBWYUli/UbyF8HK33SqoSixogIHHqfWSJoNe0z1EBHo/nn+Ay3E
	6jRV0BLlHdD/Hdq8CJ335W1nI25B4RzVjdHiqNdXDrS/WE/GYlsi7DZRIghLRg4EhrTk+YqbZvN
	dx5D4LczH64HqnT/7YUoT99nXeqDfrjasMTZM9cUFDezeIpkJt5gT3ZkQX03c+7AlDroadJhFKS
	RuvOIkr5DQ5Kw+gOWhbNf2Nn+Bbk+dG2/3iDbaIzBCTuqFcQ7EnJyu7NyR5UdIewcDcWn1GBkQ5
	ITNhATRlhbdegpc9ql/V5ZbE4Q3mOgx/XrbcDALxAD/joZwfx3sCaE/vA4VsgjjuVroHRyGE0wl
	+lCMVsSL7UuQzOyMgKxCaA2Jrx9PrvM0UcPg/WmakLX3kyga+OZ5EGyici/e3FCuusmE9HPd8LJ
	HFgqUKbG2Hgo9ZSSmyNXMvFKbN489OdGGhrWShBBGHCS6Gs6Wuyn3GXsLehJ0J5ajcp0N2beU6e
	bC76BGvb0C3SdzcRgd2jchTd4fNC
X-Received: by 2002:a05:6102:15a2:b0:7cc:2fd1:7143 with SMTP id ada2fe7eead31-7d2a1593194mr1895441137.17.1794018355909;
        Fri, 06 Nov 2026 18:25:55 -0800 (PST)
Received: from localhost ([174.93.36.89])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99bab48acb7sm3106680241.1.2026.11.06.18.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 18:25:54 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v3 4/9] remoteproc: qcom: pas: Add SDM670 ADSP support
Date: Fri,  6 Nov 2026 21:24:48 -0500
Message-ID: <20261107022453.159341-5-mailingradian@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261107022453.159341-1-mailingradian@gmail.com>
References: <20261107022453.159341-1-mailingradian@gmail.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ADSP is used to control audio and sensors on the SDM670 SoC. Add the
compatible for it, with the same data as SDM845 except for the LCX power
domain.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index f37b77ae187e..57a111a0d75e 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -1122,6 +1122,21 @@ static const struct qcom_pas_data sa8775p_adsp_resource = {
 	.ssctl_id = 0x14,
 };
 
+static const struct qcom_pas_data sdm670_adsp_resource_init = {
+	.crash_reason_smem = 423,
+	.firmware_name = "adsp.mdt",
+	.pas_id = 1,
+	.auto_boot = true,
+	.proxy_pd_names = (char*[]){
+		"lcx",
+		NULL
+	},
+	.load_state = "adsp",
+	.ssr_name = "lpass",
+	.sysmon_name = "adsp",
+	.ssctl_id = 0x14,
+};
+
 static const struct qcom_pas_data sdm845_adsp_resource_init = {
 	.crash_reason_smem = 423,
 	.firmware_name = "adsp.mdt",
@@ -2035,6 +2050,7 @@ static const struct of_device_id qcom_pas_of_match[] = {
 	{ .compatible = "qcom,sc8280xp-nsp1-pas", .data = &sc8280xp_nsp1_resource },
 	{ .compatible = "qcom,sdm660-adsp-pas", .data = &adsp_resource_init },
 	{ .compatible = "qcom,sdm660-cdsp-pas", .data = &cdsp_resource_init },
+	{ .compatible = "qcom,sdm670-adsp-pas", .data = &sdm670_adsp_resource_init },
 	{ .compatible = "qcom,sdm845-adsp-pas", .data = &sdm845_adsp_resource_init },
 	{ .compatible = "qcom,sdm845-cdsp-pas", .data = &sdm845_cdsp_resource_init },
 	{ .compatible = "qcom,sdm845-slpi-pas", .data = &sdm845_slpi_resource_init },
-- 
2.56.0

