Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D006E306B08
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 03:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787629250; cv=none; b=D7Rh5b27KsMEfpF5aptq7hzmIU7w9vxwraUnaT8t6ytwN8yJr6JOkdys03ub3iNvlp6pgcMAQZKBxtZYRspfpKvXirbqAWVvKi7JZ4ySECxwDQQ0BmGJQkohg3pbWQuaaRyE5r5yUADObB+MTTfTQXi8P1xh/7XlzvjJkeYsw90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787629250; c=relaxed/simple;
	bh=YgWcPqpc0Tw7AwiZ7DA7bpWlNDJxbNEfk70+YLHN3IM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jrGPd6xcgOO8a7P89ojPDUQkG1X8JrPqmnSYbw2LHyyCvLMD4soGMjvNiwnjb/IHH6Acgh8mjcb04ulV6yCLUw+gV8tT5YWPHWV516mrFQRb1AweKSRk+nc13HiZ1yjS09/fu+vNIGsTedLLZsHohgeLzhvQq7KWS0NpJSZOjsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LvIDGD7o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jqEoOK9T; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LvIDGD7o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jqEoOK9T"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P2R2ZO404993
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 03:40:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UKkMnWvHtEU3AJjdFVpOEvwgEQWljpY1f7+4AWt13UQ=; b=LvIDGD7oXM6BuZ+f
	QN+FzLo47JYwr//wpWzAWeh36y4cR+eRp/3KKp9r0U1mx5+dtrsBWflKQl3nDes1
	uFwtV+nPdzPFqFuj7nmap4HgoUrrJT2qJNEMiDycpwv8LK957sbZbpYuqK4IYAvF
	XPIOrqRHEtUAT0e+hGvrVziqEwTH2mET2aKV3Ii6v6QzBjEdbpo7OZ5K5r1vJ5Vf
	vM9KW3ZPr0YJYp5zSgtPRzCzvqC93Mw6ggInH6qjlrr2/kiCxv9Eo4WYKUpHAP9i
	gGTUdeMXnp9Igj56b1P9i1Ia00hZxnuruoI5OWAR7PHWek4RUtFIw+eNQdH7xEzn
	btEGHw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8y5jgq3n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 03:40:47 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d6ae2a942dso33122315ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 20:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787629246; x=1788234046; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UKkMnWvHtEU3AJjdFVpOEvwgEQWljpY1f7+4AWt13UQ=;
        b=jqEoOK9Te1V7rjXkMPDtNy7TMmXtykh0mKbyiKRDiM07A2xl0srtv1GyAi9pb/xpoz
         /6icF3iLRpwESupjLecoP1UNHIdO5DMSXUGC3PUJdWMuNdCoA9nehpM3sc46h4LkcVLP
         Rf2bzQTPI4Gh+Ekg+Hvc6gF/JecZkPlTuV6yQ7jYPSGNghq+Ddk1t7+w7uirqwBNJ7Ay
         COPSC6y9DEHcbk970eF/5kY6w4O5jSha7y9Tkr+GUE9zqxePZZEu+OwD2KNpAIxPiahI
         Ag0U0oMj0CkRXUBmEZdb4sc3YaTmTgEX/zJS20kKkkQDLsJM58H6OiUzbQZDEg9ruV4g
         PRag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787629246; x=1788234046;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UKkMnWvHtEU3AJjdFVpOEvwgEQWljpY1f7+4AWt13UQ=;
        b=E5FC8EOaX/snOZ1r23RxU03zda9H8TVzX/Jdl960Y1Py5YApwnMn4Caeq8Mtz5zxKa
         K2/wIK3JPcgIT9Yt8lVQjRJPmR8b+4Ymc9/Me1SkeN5sN0n/HwHs8EG3IDeEfLhhnmsO
         pXgGN9TTd8L0DeRFtEE6xF/OiEyRd/pszAW/iGW3NbjD9pBZyfbRarhg1lyytNPYiu5H
         ANLQvsdQ29CLZudPYVa+VPWhs9H2mfqQRGHAgp7yobpKlegllXegriUtfRQvCgPwgGHE
         lPZgdm+wPUYICftagZbrPit3Lf1cQs/GxwIcR1lfV2eNjr0oteL87uHwP318EZkltCbC
         NK+A==
X-Forwarded-Encrypted: i=1; AHgh+RostpGcp57LTdhtHq/ttMnQsW/3wf/rg/Y9SPmfkqthuyzJ7oEdCEZQXijlOTj7C1JKIHcWr3cDfMvfHSNY@vger.kernel.org
X-Gm-Message-State: AFuF++mX6uKQ0EzebLT9Oqkh57fP2p25fwVhWHNLHoBCJHxTBjC56z8w
	wPhL5ARBEJ868CLE49ZTNiJMSuvxNyh9s2c4MER4y8/J29Wbe7uknzMIDy4j4v2QQCHVi9t39ze
	ah//aXhQS0mo1AgQ8CFlea92Rxp4GKn2Wpr0wl31JwBdNhJpxs1rPuxkpehi/S0xqy6qA
X-Gm-Gg: AR+sD13HFDLNxxMd2iBwTRm9h8+tLpYlKZEnMWcVnqfvWF1MOHd3fjo9wc5DCFmL/FE
	8IRDMzd/GXm10UbtovcAxAgXyuw8mdDRXBF7jk+VdPQr18cu74K6n3+bb7Yf4S665eQImHQB6oq
	mu7Zv1UDfz4RoCtQVShG+fuymywToEaReItwTunxuzAZqCreAx/EBq4flVdrH40E3tLwAe2O8Rd
	qEOiFsyLq2LaPiXAxKAfnvTG5R25NHnZ1wRFCspk0Nu5EknTkOX96oCD+O+poIL3H07sKQSBqJl
	78tpkJZN6/ecPZ3Ht5Y+sk960YZsgophW4CaZsEo/sXtdtbb2BW+4Q624uqUB+N16KamRdsddjG
	rjWZVb7oqbZ5YZcWmkhdSrYTW9KDWWtzpeE8=
X-Received: by 2002:a17:902:e552:b0:2d1:1f73:3667 with SMTP id d9443c01a7336-2d64ae3b141mr463741105ad.1.1787629246477;
        Mon, 24 Aug 2026 20:40:46 -0700 (PDT)
X-Received: by 2002:a17:902:e552:b0:2d1:1f73:3667 with SMTP id d9443c01a7336-2d64ae3b141mr463740505ad.1.1787629246082;
        Mon, 24 Aug 2026 20:40:46 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f91d36f9sm46440083eec.16.2026.08.24.20.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 20:40:45 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 09:10:23 +0530
Subject: [PATCH 2/4] dt-bindings: pci: qcom: add Nord PCIe controller
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260825-nord-v1-2-7c02f2b8765a@oss.qualcomm.com>
References: <20260825-nord-v1-0-7c02f2b8765a@oss.qualcomm.com>
In-Reply-To: <20260825-nord-v1-0-7c02f2b8765a@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787629229; l=947;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=YgWcPqpc0Tw7AwiZ7DA7bpWlNDJxbNEfk70+YLHN3IM=;
 b=FgWOWKoZqFMIeDM9s3u2DQ1/HwQCn4fnPEBelR3iZCOLdX5yJicTe3SRleJLsI5RGWTaneI8p
 vd/fr2IeVxYDi0IwjPe0J4/+FLJ/omLcj9r2e4rNZuUidLXjPqGjkz8
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=O5QJeh9W c=1 sm=1 tr=0 ts=6a8d0ebf cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=ly1VyIkaSgMpB_u5KqwA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDAyOCBTYWx0ZWRfXyuVjwbvJkNKD
 Dtwp4iRttUX7gcv9Uzq6tIsqp/Y6Zq6eG79rR+WSXT6JPVaFGqE+j6sPTfEdBVo5b1IC1aDT2b1
 4jxRaEu7GyEHuPCzzuxEq9nDfnG3i4HCK+RlLFq3X4l2xXRX5m3ZENtzCqUAcmt4Gmj6pR0+Cs7
 Zp9qXyeBHswAwailkKH6RqUdVjrRT3tx3TaCh7hKrJUVbdGxINXLFiewokUvY36DSAh4xkcvvP0
 T4rtei7VpHsUaAMe1p4s46ppG6zVShlfUM2fRiWgFNBYxGzeJJk25YptIZ93JScS09SJ00l/h6f
 JWnTF0ZsDFK1AwpY4cjNsx3kTA3xnryZ3Mk5GXaNLVekhkTA5fYOx614Vb28gMYWlrTvPE1nKvU
 ozw45ZQx6skPm+S0CwiRcSskMgbvMhCMkl7G+VhOJcuG1XdPS187u23j4TON57z/H0qEfNglhRE
 2McNxL9ZEWDLU245qVg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDAyOCBTYWx0ZWRfX0DnLxRUXi0xV
 O2NxWwxE+9nFpw4iBAs6lWhbW+ktsp9EPvCojraGHqnx307KwxSDWS3S/rViC75NAkEYnw1xgtJ
 quyJh6lY7EbfD858NgLE8CImVzv6yfg=
X-Proofpoint-GUID: Tk2V31Kg65_zRVmqA_H1lYNA6yO_ExcZ
X-Proofpoint-ORIG-GUID: Tk2V31Kg65_zRVmqA_H1lYNA6yO_ExcZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_01,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608250028

Add the qcom,nord-pcie compatible string to the Qualcomm PCIe
controller binding.

The Nord PCIe controller is compatible with the SA8775P PCIe
controller implementation and reuses the same binding definition.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pci/qcom,pcie-sa8775p.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-sa8775p.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-sa8775p.yaml
index 63630a814f28..b8ba2c4449b7 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie-sa8775p.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie-sa8775p.yaml
@@ -20,6 +20,7 @@ properties:
       - const: qcom,pcie-sa8775p
       - items:
           - enum:
+              - qcom,nord-pcie
               - qcom,pcie-qcs8300
           - const: qcom,pcie-sa8775p
 

-- 
2.34.1

