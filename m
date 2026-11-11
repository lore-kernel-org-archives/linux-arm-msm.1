Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794418310;
	b=tKTcCOtfcZn0NpZGoWyoWOXXjJLjPrqpl/xc2VyZSfp8Zv4neiiKxuxyVrr88QFuA+Y1
	 iWeYcdRmujffic1FIPs00lVBZSnzRZjwA6xOLF8WGDnaN3LGG5ik3q9knAAXYA/QR+EpF
	 b/4zdRkd3EGjUhtictDq8+lG2Q+biAg0BFAxcuiTqy5w+2pIHQBYKPid+naACkvqEtRVe
	 LpU1bBOqrj3Pv7m/CNVQMHAWR5f5y0hVwP9NU2d2kCcxKMH17NOBbneOTPWO8gIhvqBrW
	 caMPCqwaHOeXfu20ZRwqTXCTPhBy34Nr932W18trvT130EFtF9sKgTGXAR+eE65wOSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794418310;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=7zEfWD0gKNdLLpb4i4FbPNLheaURh0EVvm8kyMPPW3I=;
	b=zGS3fZQiAkGuQ1lPhwLBrDgX3OMsi4sqr1relKkcyVEMnRyg3rRzIU4lfmWxccvDEl5u
	 d4aN4K14S2R7eZR1wjTK1B86NsoZs2B9lnDB0Jc07vgNqwmzxpgJoCUPefYeUNYLSt7Wa
	 QlXuYVqY/ayBrmVcksB3K9Xc+heRcgvk8ti58WX0qUk0CAt9ZQ9EGrF187bxNBhzssYwr
	 toWcqsLAW1Z1TZ3T6ND2TUnK8wpyQ/oaVrc+i6lxjgffXmRPbABDC1hyriQCC2ktnUAVw
	 tW6jhOhcJRYKFI/UHdONHMc5I2DxJMQn9D2sKtOBp8O1e8Ek0O4fi/D4uWNbI0xR9kQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GMpyGTuW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QwMPo4LU;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7C5606A896
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 17:31:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D7C5606A896
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GMpyGTuW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QwMPo4LU
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF0AS9618000
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 17:31:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7zEfWD0gKNdLLpb4i4FbPNLheaURh0EVvm8kyMPPW3I=; b=GMpyGTuWfKCtD3FC
	JEHPmo0do8hTcM/kvQ4VrfQCxNC8/Evbu5HPHqpPp/nJOvRz/mNyNkhP0n++8e+o
	rqJPVMKqmENLTDAjyQeXUu+cfT4vGtZzvSk7SkJ3c9GTayUM7wGJXojLzv+yX6L+
	aZRNYSiEtLQcNgG1B4NV7gwyltqxkIKE+iSKXtYvBxOcg/UHx7RMWcmTwmzy8XdL
	ucFwb4k6ktd6g97twK+DrDQoJ7eFxHJzbO/mn9KEPRa8NViHldvt+8Z8wnR3Okjy
	o+RmpbvurHjyUENAPAtU/ZvCicwB2E2KQvkL1dX4glMP/YaKT9QAmc1OwCiSY8Ms
	OSRWQA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvpjjsu7c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 17:31:47 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b17b31c3beso1255624a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 09:31:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794418307; x=1795023107; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7zEfWD0gKNdLLpb4i4FbPNLheaURh0EVvm8kyMPPW3I=;
        b=QwMPo4LUwp6zNAaQGRIkZXrXl/eQLDj3QwXT54rDzoPc/UuHK1LibT92hwGSXkJH9Z
         3kFoCIos64uSJblZjlEv68mY7EIa0aHOE+wV2i9ROHSAxMGYtbOzBXu/b9grjcO+689M
         R6Y/8/mWfeBle6mUtq4ajl3tXpmV3XHAdk/D3Vz7sleg/+RwZ83DJIGYbYSKsXDHMlgs
         bc5b4V8tZzcQo3sA8EcD5GGN48+frUVtjqq55SFarg//TpY7unzLquSzknBDCdtFSiOJ
         HWFhRAQjWI6b3CYeMXwdRN011JxVsWwdS/DPYo4S1feQPwMFE2/Rg63K2V08B+p/BmZH
         WFFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794418307; x=1795023107;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7zEfWD0gKNdLLpb4i4FbPNLheaURh0EVvm8kyMPPW3I=;
        b=ZncBcPX6YYV7RTRBWm7f3CJnPBZZKmhHA5pw3YebOgWzCYFdquWGWopx75DYRL0LQJ
         9e0DtMNRUbuovpD02LduGoDcvys7DpQf5Zhv/lfehVXI/lvdZdIcU4huQ+u3SsQ7NH+g
         Vt+uqfpWnmP0RtgOCY8pymvHVVcAZeBYCtm6K+WJBFHuBZm9DPdEqjS85TW2tiH8Hmx3
         gTaYuG3YcJ8iFnnZVdhE6lJRcf5TBd0sGPhyRcJmh1pBwE5U+qkrkuaZRM+NBhP9MTEL
         kuC0VO5ezVZOY+tuoL0Zl2H55Bex9NePl7S6hAB0S72xAcf1UFUp5EEytoH0Ti/EhBxP
         8FKA==
X-Gm-Message-State: APuU4Z8bvNDDYOJahqjlBO5B+dMj6/qT+OpeeQR+0QUv+8TdhrOtwyK3
	qxX49sqDHjThHrbuGQEUnX1wMPqB0n9PdpI6mUbW/8adOVv2NUKnkQUKLk+Qr9wQi39/qCw8jG4
	/fh6ros9vibVRnkKgZYsJzWc014upGYIpR7l/G8wanbwVOFaTghyFZnhbHRgeBdy6H2WH
X-Gm-Gg: AYBFou19sVknLrFg8hf7QNVCV6lgT0CW93QKR5eqRzeP8YDFQdhwX7NPbB3PlVdUxhk
	xxovQJqIKJnuohvy9WIYdeufrYGXrU51yUHKkylRrAvvvvZqzKfR7OcqkN6PnZu5Cs2HSFefN+P
	O7/nSIuhD5OLLatIN+HyAtlTlkKpWe1Iq7HMvH0HPwB9lXqlwvX4dgP8G+aTuTS/VXLIyGF7LVm
	uTKvoAc8SgiXWwBbsYHg6QTU2gS+Drh2bNmDlplFx8/I4dDxJ9P3Vy2gl5Sb1f+KIVOGB5j7FsN
	Ysa7PJSHpwF39Wwd6INEtkdjEvcXzj01aqKZoFtTPKyEjfuiM7oScSJWmZzmzm+w8DtuXPYHnuW
	kK39lzaO++I6aedKN1CMpqg508o0xbheobGFSVwe6r59PzdKiSv4TldHH5X4Eb1vCFGni1jpo13
	3dXGGvHLp0C+LiYqHyYzrMEK11lxFdci0hYeX7/jkJgw==
X-Received: by 2002:a17:90b:3c44:b0:3b0:a3eb:759d with SMTP id 98e67ed59e1d1-3b182efad9cmr2756598a91.10.1794418306983;
        Wed, 11 Nov 2026 09:31:46 -0800 (PST)
X-Received: by 2002:a17:90b:3c44:b0:3b0:a3eb:759d with SMTP id 98e67ed59e1d1-3b182efad9cmr2756575a91.10.1794418306531;
        Wed, 11 Nov 2026 09:31:46 -0800 (PST)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c42c11sm237305a91.2.2026.11.11.09.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 09:31:46 -0800 (PST)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 23:01:26 +0530
Subject: [PATCH 1/2] dt-bindings: phy: qcom,qusb2: Add support for remote
 endpoints
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
Message-Id: <20261111-shikra-qusb2-charger-det-v1-1-5a9d919c66b5@oss.qualcomm.com>
References: <20261111-shikra-qusb2-charger-det-v1-0-5a9d919c66b5@oss.qualcomm.com>
In-Reply-To: <20261111-shikra-qusb2-charger-det-v1-0-5a9d919c66b5@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794418296; l=2916;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=owFjultANOxmQtS34XQvZEam8JgpNAnt9Xs6zAWLZVM=;
 b=c3V0jWnq4UiJGGT2KZZQBL4VS3BaOfk2D7xD1gxg2+qfMsMVHw0jUUqQdD15HC+Z7Bno1LeCE
 J42X6d6Rf6pCafyo9wKvwqHm5nWiaXZFfmrh3ZQ51lGw/Ee+F9iyshV
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2OSBTYWx0ZWRfX+PZJoBei2APm
 4rPjYWz+gctUnV0q0sPADlv7GxhtqujWkJ9S/AI413LNxYyWlDxMsLFQvSlGiUVlSq/QJRPHLlu
 1i6VVe+205QNxrKM6V9AQQXRl/RgaFEjDfi6W+aLGXKSwsumTrzocMucFfCL0yLfanTWh0NyfHy
 mKWZMd8Tz/va1XFcGik07MLxi/cZRZigM6+nX4s+nyC1PRPPr5XmJ94nmjY1AbvfXpEr51dmPeA
 LQdksUzKdYN23NIfenKLFuWCXlrWlX0H52oR1s0jRNiHaxdQhsxk861boHrOVN6AGv7wUDoYwkO
 Uw2aiO3mr0v9A3NhZ9ZfZbqqvGhwbI69m488vy62j3deh5vv/rIOrfF/S2+zEPupryBkwhAtbm6
 Z6ETs0HOlpWvPHG3GA1Uxc55R8BHd7tzZ03AL32aumNrsTOfukWLjRRYNRFb6JT05XZiqdJ54jt
 epyJVR0G1ZCWf/OLUgQ==
X-Proofpoint-ORIG-GUID: AXWTg126DOBx4bTlBuzrTuZr4SahTsHy
X-Authority-Analysis: v=2.4 cv=FeuiV5+6 c=1 sm=1 tr=0 ts=6af4a683 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=VqWNwAWn-JPd5HJ3FDIA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: AXWTg126DOBx4bTlBuzrTuZr4SahTsHy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2OSBTYWx0ZWRfX69KMkdYZ/njH
 twk8lChQLhIe3IaHvohOZTp69XoKVlCPMuNsjOCy7JejnMzBP9BNPfZQuSd6Clrxp1l6bUePit+
 cNEvjShGD/yuH9utiMXqCmY6fVhEugc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110069

QUSB2 Phy HW is capable of doing BC.1.2 charger detection. On most of the
platforms, the charger detection is done by PMIC. But on Shikra CQM/CQS
platforms, the PM4125 doesn't have ability to do charger detection and
that responsibility is delegated to QUSB2 Phy which acts on the DP/DM
lines in its control to get the job done.

During process of charger detection, if the controller is supposed to
enter device mode, the charger is detected as SDP/CDP/DCP. The controller
must enter device mode only if the detected charger is SDP/CDP. In case of
DCP, the phy can be turned off after detection. If the controller must
enter host mode, charger detection can be skipped and hence the phy must
know the role before the controller so that appropriate decision can be
taken whether the controller must enter device/host mode or not.

Intention of adding remote endpoints and usb-role-switch property binding
support is as follows:

a) The DP/DM lines do go through the phy to the controller i.e., the phy
exists between connector and controller. Hence adding remote endpoints
depicting the same.

b) Although the usb2 phy is not the entity doing role switching, it still
does need to decide which mode the controller must move into and hence
adding usb-role-switch property to allow role notifications from charger
to go to controller via phy.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,qusb2-phy.yaml    | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
index 001fd0ccc985..0b6b2933dd98 100644
--- a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
@@ -159,6 +159,29 @@ properties:
     maximum: 3
     default: 0
 
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    description:
+      Those ports can be used with any connector/pmic node that is able to
+      provide role switch notifications for charger detection purposes.
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Connector Data bus
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Controller data bus.
+
+  usb-role-switch:
+    description:
+      In the context of usb-phy, it denotes the capability to perform charger
+      detection. Although phy is not the one responsible for switching mode, it
+      is the one responsible to take a call on whether controller must switch
+      mode or not. In case of SDP/CDT, the phy would inform the controller to
+      switch to device and in case of DCP, role switch doesn't need to happen.
+
 required:
   - compatible
   - reg

-- 
2.34.1

