Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603AF364934
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 02:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792376163; cv=none; b=gx/cC0gwZX7thu2hlwz1RuiV+5AfmyUFhIyJKPOs8CVKO6U6PjgHSz6GvVhby9ziR1GZuTr5xT7Pww5axk9HlQ6bDiAQDDrhlCuwAMP8l8UgG+QcRdt9hdq1pKULUeg/qKCkE47MMpgyGIucHJIIKqiVEM1MU1ordAU+Y9AKFzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792376163; c=relaxed/simple;
	bh=9iNBNzF/O/OCk2M+YkQl3DeLvr7QYK389Mps3ejvZS8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=okO6XWEizBHHGRm36kKQrc+wiYZqky1WZi3xPkidRJVCHdNVSVZVJeGSEM1/sQ1M/wnkxvPSxUAc8WarT8aAd1J5M5FrtXEOjvEgsMrWNIuQ73/bdBz0npkEdvJi8syxGbI3BeTIhOCn68sdp1goa9QdKR++9V5PDbyg0bp2NSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BtyK6OcW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BQBknROB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BtyK6OcW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BQBknROB"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J1Fbwf966448
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 02:16:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pK/JsYFhvVy
	JWwuTEf3AYzE8dP57u1HvP32VitU3Qbw=; b=BtyK6OcW01M8S9FK+Dk4B0rDAkg
	eS5oQ42XLhj1Egh8XUaDLjj5JU+W5i3EIKbXlCdoliX34dB3rUpLIUi3WKm/696W
	5ypMYYoD778qTZfWfLq/+7ktjsWQoUr9hakqaOQrwEAiEI7tIYQiwbR/fEb6IIFz
	siY9IFBefwLraYCi3qwKpPizlA3O67yeMclN5YTzGNEnJC2mkCNFhkjIDTUuxn/W
	9DQtkR6QkKK5zUcn4Ost8x9mw06WXx9P5JFIaSrNSkVqqKJhs4utfgvQinCb4JQh
	DJrg19bUZNeKJO++HdDqf/mQX9UzhMtn7jGpP0f9Q2MzzY+bqWe4xlEsWUA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc0bgmkqw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 02:16:01 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-357e2bc3b1bso2848661eec.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 Oct 2026 19:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792376160; x=1792980960; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pK/JsYFhvVyJWwuTEf3AYzE8dP57u1HvP32VitU3Qbw=;
        b=BQBknROBNI0/ar/t0mCc9t5PulC2X1BzpgjDZWeyhysl7KXtFF3y7WtiL3TxKyVh6z
         4/EwT7ULI+9Kwy1i24VLbPzTl4bUnZvgSPxpsOz7FvFcx23MreH0Vj2BVPCOtZrpmUkq
         lpixd+3RrnOFSRafZpVDHA2LtuWtEpBFGsV7+7RIvAX/EEZYJ1mrAiJ0f2yCWpj0sP2u
         dvfwq/m9zoe3rlt1yP7eH/ZaVG8WfACraJGtq53pCTEnuZQHcfF+j0cNPpFUHxPnQAZr
         NjQ3z4X7AaTurrCYdbmzMsS9RN63Iqn1TZ6kSG5puyiME1ENtwSLrxxcesbwXkvko3tj
         0MwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792376160; x=1792980960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pK/JsYFhvVyJWwuTEf3AYzE8dP57u1HvP32VitU3Qbw=;
        b=1GrTd9ZR+YDh/CeCZCy1aB3BBkhWQLy+seBaMGFRE5CXqtgdhqO7LUWkvSsr/1oo//
         Vo/+zOjQgNbHiUneMpd1gG88YYnOs6lIJNXvvpZB6KmsUUem3ZXmBZFRf5V42sroIiLS
         d7S59ICgGA4Ef07TjsmwmQAQruSRGNddcM4bpQmVlzMu/6+Zmj3aS0uLRcNdN/xvTVKs
         Z6eserq/rk/X2CzOwTg8tQpOIiEh4zCgUP6qRzfFo/eR+9d0Ojv0KEz5rinXdTqtPX/z
         nQmGB8pXSYr9nRDSjzC5n3qfR9uvUNl/inNWtTyRj+umAG+nY+TNWGOZp7S4ykv5Cznw
         XgVA==
X-Forwarded-Encrypted: i=1; AKwUvByG7a2BHwb5/ziVkNoHdOc70ydOb4mmMmVAFsnFuiN6ODLMTIvFufFSL9hGkAHBCKsSrJLrOtUMhjQJhUnL@vger.kernel.org
X-Gm-Message-State: AFq9FYLvg++dAxI/7YFB8XazNUXmYkCs2QuauIHho6SuPtuxrW3G/INH
	bwX+GNp9SdzVHnIWvd8VowB9ax1zSR1VAwMGNdLnWtXy01VkN3IVBM7VsdkFyzdmkrGYmmgnm79
	bUO84z1uA3FO9T1+d58c0ANSDQ1Q2w0cIldvbbEjywOfDUayBDfzCD1KDO13a/wjn86AT
X-Gm-Gg: AYBFou3G/JWSZ+KXwReOWt1HhPY2POEMrkTUyz5vFROrDgnDBBV2TgV+a/u66yOB1O4
	x6AV2NC0968vRUguiHWOgavS9p1YpS7Vh6VU5hVdghSWBfpqgWvLjSJ/wBsHeHeqo5qN9BEPOGm
	v54tgDDWhnzZya81m/KIPt7OBot9Q/3zF+KTutZ5jMr7pfyiqLXpEzJpaoJ9Di/x7oa/q+PntAm
	5JyOTJ70wOYfoZGOaFT/SWGgaF77dqqBsHGAGxqKdOiXwd/EGQGFJJGSVQafR6F023lXTmf9kQw
	nZjnkeRQRpXayw4KBEJHCbt8OZNzAhfVQ77ILB0Stm2DzevbdSga4z7ay7e2SEV/aUFrQshSzGz
	ry7HXsg/yQzTH0FlLdmAP5ccQMkUfe9P30YCEuzzhUer+76FAEg==
X-Received: by 2002:a05:7301:2d2d:b0:35c:89df:812e with SMTP id 5a478bee46e88-361a302a214mr9428303eec.34.1792376160319;
        Sun, 18 Oct 2026 19:16:00 -0700 (PDT)
X-Received: by 2002:a05:7301:2d2d:b0:35c:89df:812e with SMTP id 5a478bee46e88-361a302a214mr9428252eec.34.1792376159644;
        Sun, 18 Oct 2026 19:15:59 -0700 (PDT)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0cab0sm33841550eec.3.2026.10.18.19.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 19:15:58 -0700 (PDT)
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Udipto Goswami <udipto.goswami@oss.qualcomm.com>,
        Jack Pham <jack.pham@oss.qualcomm.com>,
        Pratham Pratap <pratham.pratap@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Chen <peter.chen@oss.qualcomm.com>
Subject: [PATCH v2 3/4] arm64: dts: qcom: kaanapali: Set snps,resume-hs-terminations for USB controller
Date: Sun, 18 Oct 2026 19:15:46 -0700
Message-ID: <20261019021547.1694088-4-peter.chen@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261019021547.1694088-1-peter.chen@oss.qualcomm.com>
References: <20261019021547.1694088-1-peter.chen@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAwOCBTYWx0ZWRfX7kMC3G5XbB7i
 LANM7Mzn6zjdjlWMTnzx/qXmuYMMRz+CwSuFsBJ/+xtbq21AuUu2wqB2zOvmmfi84ggExH8jbM4
 DVbUCMQfziu9kG6kfG3W97jbVlNJ7hA=
X-Authority-Analysis: v=2.4 cv=FayiV5+6 c=1 sm=1 tr=0 ts=6ad57d61 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=_PA-CDJEJREJmSlHXOMA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAwOCBTYWx0ZWRfX3QOXpSufnna9
 R0U0lPH+AVXXJADjWeXAvB0PS6UGtzsZRt0ypssl/4B6wrgSUkWLTMzpyPuRwFNlm26OshkuH1t
 G7xL1mwdkrEHPvCXqW9mrqFSBoDudyTz8zTr6UQ4Zx8r4Uh65ZrAtgsOglJwQ2ekAhpsVCh4fit
 coNw0tiAp8qGJHIILTt1CB8cWDYz/R4LHM6l+6VVOfLzntjKgTYDVq8EQRTmkUVFfh7O/rhmMUa
 Le6y8eaxTiT7phyyWr6Us/6t72eoJlyNWRWlIUzo+oittR1KW7bwrv7zk7W0lAxUDAtesjfw4uE
 Cl/ipOck9Hoj1SXpKlOf16UxXkvo0s3Kzenz9drQIZqgxSVZbyH8050iSVk8gU/yNq0vCcB5gEN
 ivhvz9ljuBSCVp2vGrFdDJRLR04o0KT7SAxbd8k/xkRpNq2+wOv/QFwrPSxnaWllYYYwU1k38zj
 O8G9iqtqB13HpJqxDjQ==
X-Proofpoint-ORIG-GUID: OAypSCchwThWe-JpampjVkc6s98U7p3J
X-Proofpoint-GUID: OAypSCchwThWe-JpampjVkc6s98U7p3J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190008

The DWC3 controller on Kaanapali is paired with the M31 eUSB2 PHY.
According to HPG, host-mode USB2 L2/L1 resume with this PHY, GUCTL1[10]
(RESUME_OPMODE_HS_HOST) must be set.

Set snps,resume-hs-terminations on the Kaanapali USB controller. This makes
dwc3 core set GUCTL1[10].

Fixes: 3d395de80a46 ("arm64: dts: qcom: kaanapali: Add USB support for Kaanapali SoC")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Peter Chen <peter.chen@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index bd51cd3b70c7..60c6c2c09bcf 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -4347,6 +4347,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			snps,usb3_lpm_capable;
 			snps,usb2-lpm-disable;
 			snps,has-lpm-erratum;
+			snps,resume-hs-terminations;
 			tx-fifo-resize;
 			dma-coherent;
 
-- 
2.43.0

