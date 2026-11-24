Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795517668;
	b=0zZ+lB/4Wc5TBTr24UIszm8vB8I2CPKhFyZDqFEDGdiy6aKVgDAUoAtXy/LLlKZ18Two
	 J5FB7OkBchnY8x31CrygtJAWbxqrAZIFL8y6c+ikmTQrmJyTxgfZI+ClLxw1FukcQQjfQ
	 bxH748UHuUdIk+4HT79lDXlQ17iy00KLr/8xnZZusqEqBm9nrvrZ1SyJyuv2aN9srSggK
	 TvZOnDtNJ59FnluwlIZG1PZlnmIJkUJusZK+COKI1L9MGizSX/yAJ6TlHpila5/XpJ3/B
	 HhIAgAZFocmRIeDpdSrn/4OhEENc9ZHRjv0VqieKo8X9chc4okv3BeYhG4PHGGiwIkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795517668;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jupOOIxHdFZ558Xo2FtZZu/M3iaBh2DMPBnyod4Eatk=;
	b=u9lB4Gzdhcjz+FraiD4aVV118oLcQJCVoadAwJMXWm6TvMCj/Sk9//xSPwsj9u59FRGq
	 MEw1xo9ii+QtO8GQard1BpkGsIcX6RDyFUHBVA0fHG9Lofgg4KMZkoDLeHkq5O414S4GN
	 iB9AqB/OfN9zEqFGaRIO3R4WFiUrpc9gS/BM5By9CRJKo9C1cI4+6WgYv7yVvrGIgEvbD
	 bGPGwSUMzpyO29l6KJ6tJTIFdXbkGqf24Rj2qjHptBAke2qpNWqOWI5DTX93rVeU6Nfr/
	 RtkGJUxstlQprA09HIKjbrYLw2PUu6XKPfrdxlgcCMoQ9BBWbsVIuWlOqTLJV/WVJmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jzpAzd20;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HsalsFSj;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5116F606A322
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 10:54:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5116F606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jzpAzd20;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HsalsFSj
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO8ZRhW3850773
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 10:54:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=jupOOIxHdFZ558Xo2FtZZu/M3iaBh2DMPBn
	yod4Eatk=; b=jzpAzd20lTuJ870bvczbx/t35N7BJnjXCACn80IKmAcDT2oXAcz
	x+DsAUWBdbTxS0mMBhcunfG6v/q6rKEgvjGxhUHCxdqb0BU2OzocjUpV81fmw3TH
	AUQUnsOA0mPozK9lDYwnoQgEcC310lGb0pBc/GrRwI+K0tFXQ1WSmXNMqRFl+kpp
	Ra1otslSjMEZ0VOL+fr6HPmQpyoGwKrBxNi1XQ/ZkbOg/rMSee8YpDJzUD27hF3K
	mgrwHjLx2rVAfSOeNDT2T9J/7nJfaP1K4uxS7lCkh02KNrpmG6B6f6R4Dla1RmBY
	5jLzDsLz3plMtOuagce3Tp1lBg7uR99Iupg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yvb2b06-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 10:54:27 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3817a0ffd5eso5215165eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 02:54:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795517666; x=1796122466; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jupOOIxHdFZ558Xo2FtZZu/M3iaBh2DMPBnyod4Eatk=;
        b=HsalsFSjAs308vdM0yLVrI6qYOR6RGnfgfLzmo4WtVomNVr3xR0hXlgUAsjH0BtSiG
         ZfZiloekpSdGJai2lAXUNxKTiRzVO3XNjwg4rqTAnqukHw9eeIyIkJR6k3njOwbuDpFU
         qH8LSirNEJkDuqE9u6oV10v/ZSIzmZhGFzFncc0XTHcCF2HKkmwr5rJQvKoCfle5cer8
         9Ic+u7wy2EkVeGls7mAaBb8rGqjDZhHaLL7yFmMxhBzC4W45N/1FGee0bFOXbmb3pC9r
         oY5Ft4HbOMKxzRXatZrSAOflOKmX5TKhPkEZSWXQ9vsYBbhOO3NHwEJ1f/LThBQ5sXmE
         QI1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795517666; x=1796122466;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jupOOIxHdFZ558Xo2FtZZu/M3iaBh2DMPBnyod4Eatk=;
        b=iU6yi1ph+GG/EfQEICRRPSF6gYIzUUes+DhTHcRLE7dFuIjAE5NUsuZXTDsFhkK6+F
         9/Yfg7jVXRJFKx2usZJ23R1qVKAc4M1XCKGuJ7uDNWHAIg0qTyW+yQxiZzJVNCk+Sxk2
         7CdguzCvsW75C0Sg0vn+IdzuxIajEd0qniNzLksT74/ANmJeqB5iznnbO6NzHG9sqzr+
         6SyvEQsfrzu/2K6rFcDvKVaG32rYveosovnSLff2dTx8NxBpbOUCXri4R5TzFnZpE9bc
         gjK7LqG3/Ss2XOOYH/6+IqJksxVjpgCaq8KwIH0az82JbFqAhyXfBQ5kWPG7JiTGsP5k
         +wTQ==
X-Gm-Message-State: APuU4Z+zIvT6DQVIyTNYqeg04iyoJIKWrlRQF8XdQCO3ZjTPdkUNGbVo
	/7Lykk+tfEeenqMqPPcv/ZNdDEzB4rgZQX5OANf7Ep18YHxkxQZ09A9wJVbs6PZf2mC2FbvXjcv
	WU0fP56kS4nb19eX82DfaQxhCD8iElZzWOiZyZc+XmXmJ7lF1frbuqMpwh1DxvB5kasAZ
X-Gm-Gg: AZFdTZc/dfI0mt5r9qTB3Vk/MvwSf8dNGBPUJ+dszVMfSu5FiPjcWGnv2xgsqvmUI60
	Ypx4Ho2hVHLxByH7jfyX0eQyXq76wyrMNjR2SkpdMGjLzliV+QxnkOEq7GLV+YgjWnU3B2bbWdM
	Rv1/nbCDaOzaaKkIJNCi0cH1K4WYnQQLrxNWpkumJ9i7VKPE7Z6Jo1jvleiJCmciYdMWfGiY5+v
	EKjV3gNwX64gbBy46uS9dPwdBmQ+kT1KSB+Dnm2+FTKIn7MD7lNx0MxxWKvzD31hBwx+2bBB4S6
	EgDhb/yuxbsr9aSZ80qp2p7A2cMRUO/lXbkwtEWOpRz+Y10pn4UoiJaMJuWoNMd5qUYUe7ph3kl
	cE16YtmLfotwMYXknJgRfPd/feU4JQth/jICjFAPi8aFCA3hGnfDlSvozAP+1V7Ud+WwD8HsT4e
	n770+fCwPnUbxJ7iBwBMYdJU93O04MWqUqcWfbYh9kYF4y6Vth+/QQUzA=
X-Received: by 2002:a05:7300:7b26:b0:36c:dd3b:a3e4 with SMTP id 5a478bee46e88-3856f25f8f2mr16950893eec.3.1795517666072;
        Tue, 24 Nov 2026 02:54:26 -0800 (PST)
X-Received: by 2002:a05:7300:7b26:b0:36c:dd3b:a3e4 with SMTP id 5a478bee46e88-3856f25f8f2mr16950868eec.3.1795517665485;
        Tue, 24 Nov 2026 02:54:25 -0800 (PST)
Received: from hu-ymg-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd40c5sm52581782eec.10.2026.11.24.02.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:54:25 -0800 (PST)
From: Yadu M G <yadu.mg@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: qcom: geni-se-qup: Add compatible for Seca SoC
Date: Tue, 24 Nov 2026 16:24:17 +0530
Message-ID: <6e09e1ce0d9250af78da72e464b7f99f942e1d7d.1795517657.git.yadu.mg@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
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
X-Authority-Analysis: v=2.4 cv=aJ1lOr9m c=1 sm=1 tr=0 ts=6b056ce3 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=KiTKUbYwaCXuUAD60eIA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: wl2gBxlo9CIEqHpTJZkXNvtdpC3fdjTS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfX+gvLzFi6Ez+4
 k3Z61DTt9TybVYKa2bgbYVBgziV3iNsy5aEXDZliFnm/PNvzfwVL+azSx6oD5+nxAynTofGh/3v
 2s1INAkGku5iY6It1STgQZr/tEQ4tvs=
X-Proofpoint-GUID: wl2gBxlo9CIEqHpTJZkXNvtdpC3fdjTS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfX8gTfPUhNVJBy
 j/ayfsfZmlxqwxK1gHfkeRJvufV/2+88RaI+gLeuGOErQV3ilPOnwSwojV4CljK+6Qxbt5uNkPA
 rRdQsVEmdEsOVpOK7wumf6Rs4bDV6EhKa9ipfpxDi/h04/8zPV8L8IRdArdsWzDvVabjLNCH9CZ
 4OzquNzGHyFM5ONCAeOlwcVkKjsJLNVJwFkbjJFmSEAbMBSPvDS2ol1mmFzXAXEov6h09dOmaAK
 wGDFid4xpx4rVd+RXQ99pkeVo9MtXwBoSuq+jIW5fxQyUnKqLMzoN1p5wFZR/Up1HqpvlBBjUxg
 piCwKzNeiB6z1WNuWuS7JUSOUdl7wgwAY8J9XBHg614kk0QzmpV5ngH4L7IgzK4rrCskNjlZov+
 IA3auFkCXtzVKjNSw9xnhsMLRDUHzBpunrzXYVQNojvwb11X2CMyx4RXWmxwSSUGsoPpguMUPW1
 +AH7Ro3dVz+h0yKBsPw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 adultscore=0 bulkscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240042

Document GENI Serial Engine QUP Wrapper Controller on Qualcomm Seca
SoC which is compatible with the SA8255P one.

Signed-off-by: Yadu M G <yadu.mg@oss.qualcomm.com>
---
The Seca SoC device tree using this compatible will be posted as a
separate series.

This series was prepared with help from an AI coding assistant
(Claude). It assisted with review on the device tree, bindings and
driver (formatting and alignment fixes), rewording commit messages,
and running the validation steps (checkpatch, dt_binding_check,
dtbs_check and W=1 builds). All changes were reviewed and tested on the
Seca Ride board.
---
 .../soc/qcom/qcom,sa8255p-geni-se-qup.yaml        | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,sa8255p-geni-se-qup.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,sa8255p-geni-se-qup.yaml
index 9c38ba59662b..2eeff75f2f25 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,sa8255p-geni-se-qup.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,sa8255p-geni-se-qup.yaml
@@ -24,6 +24,9 @@ properties:
       - items:
           - const: qcom,sa8797p-geni-se-qup
           - const: qcom,sa8255p-geni-se-qup
+      - items:
+          - const: qcom,secaau-geni-se-qup
+          - const: qcom,sa8255p-geni-se-qup
 
   reg:
     description: QUP wrapper common register address and length.
@@ -58,6 +61,9 @@ patternProperties:
           - items:
               - const: qcom,sa8797p-geni-spi
               - const: qcom,sa8255p-geni-spi
+          - items:
+              - const: qcom,secaau-geni-spi
+              - const: qcom,sa8255p-geni-spi
 
   "i2c@[0-9a-f]+$":
     type: object
@@ -71,6 +77,9 @@ patternProperties:
           - items:
               - const: qcom,sa8797p-geni-i2c
               - const: qcom,sa8255p-geni-i2c
+          - items:
+              - const: qcom,secaau-geni-i2c
+              - const: qcom,sa8255p-geni-i2c
 
   "serial@[0-9a-f]+$":
     type: object
@@ -89,6 +98,12 @@ patternProperties:
           - items:
               - const: qcom,sa8797p-geni-debug-uart
               - const: qcom,sa8255p-geni-debug-uart
+          - items:
+              - const: qcom,secaau-geni-uart
+              - const: qcom,sa8255p-geni-uart
+          - items:
+              - const: qcom,secaau-geni-debug-uart
+              - const: qcom,sa8255p-geni-debug-uart
 
 required:
   - compatible

base-commit: 3191063649dbf7c0d0b768e1f3655e4c5fc6edb5
-- 
2.43.0

