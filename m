Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD8D48594E
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 11:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791889405; cv=none; b=ehv1aDUcb90DuC1tX4Ngnjlj53BqadMqL27n06h2oBbDG5lAOX9G+CZm6EIPTaG+V86gW2llqxf2En6hwzUxq5Evov0mqSSgM2Tk99btPMifVO1jNgMgk2D3zCuWN51wVbknhX4QU4DdjYMqElFMA9juLp40TeqxZUPb6cy8f2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791889405; c=relaxed/simple;
	bh=dj2HV07iJbUKgotIBkxev1vjmCbbYX4o6QipMiXBuws=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d/EmmEEjv9WrnJfJg2Qk7uO+RXhJ92+Q7K3CWc69BvmnD+zuFSBksRsLcPHmcIgRpr3Zf3VKflq67teEXLUhUDL4QkFezofWNeoB00XpbdNIxtZCXJUzAc62zmh1ooYseSk9jiV/lnY5Y7VTwPJ2Zv2c1XUrSdICBy9f7Mt9HF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KeMJFX0k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bNu1vL6I; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KeMJFX0k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bNu1vL6I"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D6CTFm949419
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 11:03:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LtSfTBfPvgBFmUK6LTNNqXLD4BtNlVBQw/rcqNOcjZc=; b=KeMJFX0kOatnNNVa
	MR1x2mQNi2NW7WkywQtt7dYEs+IxiD/5YLvZrkf4xKmjufruNI79P6AkpfNxw5o8
	4DCB5pZSl2PCh6MQ4mOpoUU+HIOg9AKOT1l9l4Sh/aayaDrR835+fFCWP8Er/8Fh
	tJem1aomKGZWqPnNBsCifloxOkyDBXb5ykTNb9KhKkLAw/QyckMHUHJFhTvA5Ziy
	Xmv+Sqji8Ld8XrQKENKmzZH8vacyKZLdz05qFAeG1tIurhMKx9XmXLJ2fVAiibdR
	PCVDNU2pnRl1kPwD8Lsnw/lalF+VS+838+UAea5qZ0/PJlixNyyZK/3TuHcE+FGY
	RnDJpQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9f6297e6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 11:03:22 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3a8041a532eso2144175a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 04:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791889402; x=1792494202; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LtSfTBfPvgBFmUK6LTNNqXLD4BtNlVBQw/rcqNOcjZc=;
        b=bNu1vL6I0pG2TLMnB2jg6Hwap3ZIi1PxGiK7kzmplyWF+XUjXFwZ2YRkiYH0BCVTLG
         V95bcJCnvchZhvY9CEILAMMjpv8qnvrCKQGQozLlM18twZWzXabODrnSkfMLtxv9p9OY
         RSGZZhgekmKYwkGGs8gfar6oSrzp3DYv6/K0jeWcmRmp4CenMO7qJLt2CneTVCYDXZyS
         0YKK554s7xpuWtVeDeXQvFJcBpkZvbJqvPZ77OleWBinXNdpPUdKvMpcSn8pDjQ8B/Kr
         tcC8j0C2ql23RQGbX5B85oh9dbHyXTGfWCnmSpmSAylAtUVjHh/xzIEa9so86Tb6paO2
         M9UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791889402; x=1792494202;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LtSfTBfPvgBFmUK6LTNNqXLD4BtNlVBQw/rcqNOcjZc=;
        b=1cqeNUnbVFMYJzXnzE3RsE6/InjpEhe+yhgpvc/GsssvntO3effLEfQ2IBXLyZ7cxZ
         JHYco6ZmDmHJUsbY79G65uCpnufgicvJ+m4DsXDQ2rYpeeNZrV4sO9d8iQ7HJYPr5D44
         odKvoJFzZHSVQx5t7uUproMDZ9sJSwVyjSXzrwvmi3TtObGIfmeBxVPXm4NYt7iXMKKj
         eYz1WpK1QTR3BM6El0ZvA9r+bGJwXfxmG4aiBEcvAdGjLJbOIHj+JU8j4osFeNXsPKv6
         YPL1Ruv2VF6MEOgj1U1feryk/OE8evUZiS7DpDqT87zkNpORzbOeAaXOTWZPnfAdhkoY
         D20g==
X-Forwarded-Encrypted: i=1; AKwUvBxE4BjnmqX5TfHdwVzAhfKsle1ju3aFSxhX60LPDPSUpi9pYDisG5oOPeMt77is6lFLxsv7g/ke6BYrvRHf@vger.kernel.org
X-Gm-Message-State: AFq9FYKHqlPSTRxeUvkYWA0aZ9WlXQM4D0IkeKo5f6ia9CNcE8aXp92o
	OnwhmWZRrubNewnF8d8yzCIoktedJ3lCeUKka2qJfTKp9Nf/PJ1LrqdhL4i6QOwzJxqX2HZzlw+
	Q6Jjg+rSjjuDAX01Q9mabthGHvZLa+DlsnS1pl/fXMrnN+6gFIeo6MRumH8A4VR11+yl7
X-Gm-Gg: AYBFou2/2Brm2+VObKMZozECw8ihJZa3IL6jbEbH60MTJdAqvnEaxCDAJQh9Mcl7Wel
	kELJSp+n7MEoFEM5qUPAbtok+YP2YTURUujgAGU2lsYkYQNFxWjaluwIie19gCtUqrgz0y87D2Y
	IcZpTrpXQbbOYaCKs+S28kh2npTsETcnAJXgoFrWmqarhV61tr/3zhbK682TrJtlKocwUuE4eHZ
	Uw7kxuSUqh8y8tXoRZPWl4GAjmXulskxTLvARuKbHLehTatG1t/Di6XSXYfNvOHYi6ZFpUdWfKf
	TmjhEOZoknN5Kyk4BWi3bbXOmqdfYBQ/jOBEuNqTWxLff0o1ACPKYLjZqk2ntmUw1jNdHEVzgze
	muTx8n1ve716nJQxITfzORgfYg+ChPrs=
X-Received: by 2002:a17:90b:2d0b:b0:3a7:e11c:4e6e with SMTP id 98e67ed59e1d1-3ab3a97a71dmr10334194a91.59.1791889401682;
        Tue, 13 Oct 2026 04:03:21 -0700 (PDT)
X-Received: by 2002:a17:90b:2d0b:b0:3a7:e11c:4e6e with SMTP id 98e67ed59e1d1-3ab3a97a71dmr10334174a91.59.1791889401201;
        Tue, 13 Oct 2026 04:03:21 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab36f46dfesm20808403a91.8.2026.10.13.04.03.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 04:03:20 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 16:32:43 +0530
Subject: [PATCH v2 1/8] dt-bindings: i2c: qcom,i2c-cci: Add Hawi compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-hawi-maili-camss-v2-1-fc93222da89c@oss.qualcomm.com>
References: <20261013-hawi-maili-camss-v2-0-fc93222da89c@oss.qualcomm.com>
In-Reply-To: <20261013-hawi-maili-camss-v2-0-fc93222da89c@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791889386; l=1282;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=I9K6dqyuKuWaYIMstHojoCWyhkP+UlD/jEvqS2r1WK4=;
 b=8YII1P3PnyStkJ3yIPaipRsaz3g2sfipTKT8WUkWQB0EgSS5eWTJ9efEApHRdonVuFArRSO07
 EImqYcDSA8KCtWE90rSryewi4jddCvdM/NK6EHJYdpsJ3F+GGPRiy7e
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Authority-Analysis: v=2.4 cv=FOKOVOos c=1 sm=1 tr=0 ts=6ace0ffa cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=phzA4CzYhpZqrDFsW3YA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0MyBTYWx0ZWRfXwGFwD7PdrWxX
 eJC2y6hFpSd06/qKez+m4GfbB4ucKw9PxrQAU+eIIAXhpVitwZBIVQQj22xRslxHMcTYM/ul3LA
 0iBkTR1seA1x/cFNPZG5XuKYrVbKk2c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0MyBTYWx0ZWRfX39GxtsyJN55Q
 MsPtoKhILCECLVugnA1JeL/rPRCHItXQpAplL2FNQZnl5Ra8Zb+9zld9q2N4tzaGUvSv3CHABKp
 hXBAHsB/zxFKT+N60S+9dpLhCkSH0a5+5Be58hKZ0HGKwNxhQmW+bW8D4NCO1IDfe2i7bQhUEXi
 dyPc0k0HF1SH5laHlEy3PsO1KOKNhhKPxsNHkdn2E6PPcib6HtyNnCeRAjA6Y1IbKCPv2uTQB09
 cHnI0ocS1qPB6dSOPd382l0i01B2ykmY+HdOEfa5Gg6/NB8nMbZ5x85pZCIqnOxahLPGc8LoNIt
 R99RkXn3Z9b9VkJmHDeUcYeWnaVDvPd/WM5VLD8rzN11uwaih4Ctz8Pt3d/Ovo92FEJvJc292zR
 JiLjawm060rJXMpjx7WoYlD10duf5RIbTlrebOj38zhkD9JNdtkN9dfZF+nOHJ1HmYJCemTOL84
 Duvzv+E1EyZNmqDs5kA==
X-Proofpoint-GUID: J-UO8VlkcyjeqhJI5XphURqjyFELbLaa
X-Proofpoint-ORIG-GUID: J-UO8VlkcyjeqhJI5XphURqjyFELbLaa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130043

From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Document the Camera Control Interface (CCI) compatible for the Qualcomm
Hawi platform. Like other recent platforms it requires two clocks, so
add it to the corresponding clocks constraint as well.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index 1e8def25ec0ec1ef6b34859709d10a2a36fe36f5..b2b4d4bcf780792515ec153c873bace1764fb3e3 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -27,6 +27,7 @@ properties:
       - items:
           - enum:
               - qcom,glymur-cci
+              - qcom,hawi-cci
               - qcom,kaanapali-cci
               - qcom,milos-cci
               - qcom,qcm2290-cci
@@ -137,6 +138,7 @@ allOf:
           contains:
             enum:
               - qcom,glymur-cci
+              - qcom,hawi-cci
               - qcom,kaanapali-cci
               - qcom,qcm2290-cci
               - qcom,qcs8300-cci

-- 
2.34.1

