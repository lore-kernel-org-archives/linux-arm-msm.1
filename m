Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE104C955A
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 16:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787328678; cv=none; b=fnzmqZY+1grW2BsVB9V7QlU04VxYO+rtlLyyAjmOOlUp6RrI46Ajr3tqdfKrB05jpLe9/PflZ/p+3GYwVR7a07ZJYCfeMPZj0hg8aJcCyR5GeTrZTYA3Nd/xsNjC12/F75TfeLdnAC2rES2JZyor1gr3UrmgTa4YzJQMwxtIE0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787328678; c=relaxed/simple;
	bh=9JHmO47xFcHiKwRcWRppqe+FIDEC/EmRY/1PhD8wx0w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YrrAtB82UCptBjAg/aP6mNK1Cc6cfEQATJ5KUhskrIgG2n1ceQhU5u6mHM3fAun1HM7iDozYMU2V4EdU560xDy7eN6qjSQmszWNAt7Da+6/Gbfp1icWt+B/sc9RYU5dXodz0oCTCRHnhN4tLkpKYMRBHeMeNke7QAQzlMIR+Fjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d9XAmLb2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cDZBAIUB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d9XAmLb2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cDZBAIUB"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67LFm5sB2855854
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 16:11:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wOoRRo1BzWfxcKIRahahL37V6D+SA2lxSIowy+5sCk0=; b=d9XAmLb2d3tEemEY
	/SV0V+IgeXry0mDhpnxfXqW1JuUmV9keyxYmh2XiCUi7KJ1FHXQcEfrPWSo0cwv7
	3vu+37Q2Vzu5+aZnKCitDbG2XLn7Mu9tONdEPOv8C/NARtsoc6Sp5UclXYAKep+B
	Hhp/D+/Z5TpHpiBNJf58LQMV37uLM5NKNFx/PMKRAMETckK7W/JuYzELNhatVZsJ
	QSvk7ofCY16GqUI323X4Dlpeu0n34jtuj4ezj3RbQuj7L2XLxaDEy70Z1pMWB0x0
	C1kHPl7BWWggG9Fhf9PVozA/NZay7YJ/atuBya/jXZXKuwLQ+B7BlrrGvgovpYAB
	dvx+pA==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6gddjdvc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 16:11:15 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4b28d7ffab0so1852838b6e.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 09:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787328674; x=1787933474; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wOoRRo1BzWfxcKIRahahL37V6D+SA2lxSIowy+5sCk0=;
        b=cDZBAIUBgqxl4HxOqUuLwg8GfBYw2hWub2BwpvMWVMr6jRJKQViVXctVUaF6+bXusE
         B+++cTuJqx+UQXRoaCA+QksMNtq89OePM+ilox8t5wcBUpxMMYE4czESAVW/owBoLU9u
         wVDPQc8csS0eGOqPsUEw/dGH+fHdgGOZUV/XYru+b6aPvUeolW8VPU0Y1zj1dV/EKfU2
         ZWYk2+xmSvjaTWPmfphV2B4xdYLw+zI9NK3R2A6ZY5aaU7H4VUDZJsSRLPYzliAQYzQj
         XaVTo0Sy/QzzOu7PcVaECvvZbsssas7sshpdhv0chOmbJyL0S+aQqjyb24sKFI/6lRpy
         yIZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787328674; x=1787933474;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wOoRRo1BzWfxcKIRahahL37V6D+SA2lxSIowy+5sCk0=;
        b=PEzthae4G3T6oipM2SFWI4386YwZxXHdGvmboOjhp8aLlMWbxR5ubzPXu09UodXtGT
         uckHpE6pgHCIwfZcIi8Y+MD9T5+K4Sm9WMbrAfLOrrmuQ3vgWCjf3SPbTo1ScfnE5uN7
         oEUnR0WbH6krY+YmZepdPWqji1g/fTZYYdmS2yvTbgRvc3sZoRSbjbfeBOMnoXNKweBe
         lGj7YGVkgBrGHPcXrxHKBMpFwPxIa6EhuGaY+EplgM0i2/l4SzjhfCQ4wJ/eunuQtJVl
         /1OmzBlJbd6LjZpkeo3V+pXXte+L4Jb9NxIIorb7IwcfJeNZ9oUE6euJVOvUu6jDCJd+
         sGww==
X-Gm-Message-State: AOJu0YzXhKjVkpLZtjdOwHjAVJsdAtgfDAplG3DTjlv+nRO1g53eyR7/
	JwWAF62bNOyXrx+lbVTbcToBSnAu4G2ZVlvtGTuiEN2Bqx8btES9QZCwrhc4eGedzbyYKz548kC
	BatCsBNST87Uz94PK81DonIyKCBkI/TKFUDdLcttlYRZYFIbzaAKQVhzZiREoNUzX8QKb
X-Gm-Gg: AR+sD111lgw73o7MjNXbDew/4C3NrvJViW3oX/WZW8K9kSYjPDzGVNPTOgQFYB7gAx1
	sgqPsCBoByUDmEIv7KgFkBsledEwDGN1s5NZOMvHqs0RsgZ3KOo9uTFBOUqbvaQAlQd5B4Bvo6q
	4gihXWGs8i6gjFATmCKt61HR3S7f67Jj/yLYvRDfHHrjfs36NO5XH1C2K9A7DNN+bWkXwCcufvp
	JaUVpn1sL+3gbUnhISmoLGiwHaEgdP0Cdz1fHxw06BQQFURmaU0bZJnkxmL9QDA0HzaYYQuLvfs
	/SnqnhwqjMcCN3MnMELpseO+kKSA+U7fP4RdlhkUJh7I1rMJ51cGqeahqQ9LrZ+2KlvKVSsUtkm
	9isAY26EI3B80F/vNIf2nbZFW/KN3IJ1IKR3Vx0bX7MOsbHJy9945515CUFarjLedbH/glFw6re
	gAguVXneCN+LcQylx//oWxUkM=
X-Received: by 2002:a05:6808:d46:b0:4a3:26e5:cc02 with SMTP id 5614622812f47-4b2ef33a94amr7457133b6e.10.1787328674375;
        Fri, 21 Aug 2026 09:11:14 -0700 (PDT)
X-Received: by 2002:a05:6808:d46:b0:4a3:26e5:cc02 with SMTP id 5614622812f47-4b2ef33a94amr7457022b6e.10.1787328673861;
        Fri, 21 Aug 2026 09:11:13 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b2d6d34c8esm4804321b6e.13.2026.08.21.09.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 09:11:13 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Fri, 21 Aug 2026 21:39:06 +0530
Subject: [PATCH v3 13/15] dt-bindings: firmware: qcom,scm: Document SCM on
 Kuno SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-kuno-soc-support-v3-13-196e2b306368@oss.qualcomm.com>
References: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
In-Reply-To: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787328540; l=871;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=9JHmO47xFcHiKwRcWRppqe+FIDEC/EmRY/1PhD8wx0w=;
 b=Ag3di3btT/XFPjezWsEE6sVb9FnCj3hpe8zj0J0Q0SOouAab1EOy4dpmgGa+2+2q7vu1xOsD6
 WyI4wCSjoG1D/AfPoIgDEjP9SKXjtAhxL2dv3aPIUrCAfJUfwsb3ZKm
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDEyNyBTYWx0ZWRfX3R+nGs3KI38d
 QKW4+lb+9YCnmE9yqHcsYs3Z9DV/RQnXvv2E5Q6kXkrs9A97dc8UDy7tapoivGEYXD1B4gi0gJl
 c0LwX5pv7atpTyyFLvaDCuNX02EabNk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDEyNyBTYWx0ZWRfXzBByR1M6yL0k
 3s2HSdiTDszzLs0Xgya3UsLEmY8TMzlPA4iSIeJOBF2/JpXyy0QRNijGhO7OzIoyuanhRZ/BM2j
 cq0hD3ytLe6g4p+snLRF+ygg4kkPd9wPV/8v7jRbf5DYJQo+T0zUWA0mYC+1dC/DTJKo0oAwXK+
 8HLfhoXo2It7FWufOytbh6vgdDWlb+5kMhAXjKhMABAe9i1CDC9ZmoLhEYWVHNSo2RAao2iPuBe
 ApIhE/bexeIscl7/RgNbhG4SVoa8Ke5ZAYx6kHvXAdVl9VK+iR2I1vIr5alNlPMthuMimePWisY
 4Eia9vDTxG/GzdiyimGuv4iKZqwHyZz4QGDhXqU0KUWRZcFBxrzn/jqaKQPcUiQ2Oj3nYearjxx
 GZyg7ZUxZNJhNS9nGvC2UHh8lu1O/kkr+esjpY73sX0smFHTj0fTsLZjB6B+4VtNNaSKYIPzTTk
 qBM9fdWGQylghz9qK+A==
X-Authority-Analysis: v=2.4 cv=ApHeGu9P c=1 sm=1 tr=0 ts=6a8878a3 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=M4Tw70yJP9P6qS8g1QAA:9 a=QEXdDO2ut3YA:10
 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-GUID: 5tbKfqx-W-Z_rES4tZXda5fAXEEqUAh-
X-Proofpoint-ORIG-GUID: 5tbKfqx-W-Z_rES4tZXda5fAXEEqUAh-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_05,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210127

Document the SCM firmware interface found on the Qualcomm Kuno SoC.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 037d4ad8f718..ecee5aef65a7 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -37,6 +37,7 @@ properties:
           - qcom,scm-ipq9574
           - qcom,scm-ipq9650
           - qcom,scm-kaanapali
+          - qcom,scm-kuno
           - qcom,scm-maili
           - qcom,scm-mdm9607
           - qcom,scm-milos

-- 
2.43.0

