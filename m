Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2CB388391
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jul 2026 12:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784379473; cv=none; b=Wn+9X1AjiUkiYbh1dS9oHz30/DFJlGp+Z7qpcfnOUitUB0QDJ3BU7Ktad+ULUmrT6yEXCJjQIfAosOWyKCXZL+9x76MMfMq9k4bGaDd+KDZ3cUU+m0L7wGCgOYoIcXtebNr5CRTP3v0p/gHIk6udew9vuJjPjjaT7XYDjIzP2ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784379473; c=relaxed/simple;
	bh=q+E+NmWhFlgl54y+4NmhcUg6y8ik/02RANvzLoFg4nM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sqNLQAoGgmOvVnlNuWNESWzibhZrp3129Hhzno//H6dIX8px8Qam9PG2AAEZd+yGNFBWH5lClUJ+K9OqMOzp61k9aOV5WfWz5Lu7EGjs/W/eDAj70GgSO94eDcHgFcieL18A0oTwNYCRS+0LpyIIGxCkud9wCPpNOGgGT/cNFIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hkYlqxAw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XKr/pDFd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hkYlqxAw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XKr/pDFd"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66IAHKO3178684
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jul 2026 12:57:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IFNe/WToyK/O4NNvagSNqrPVSY/D88aPNWNMvMN959c=; b=hkYlqxAwAU+NjA30
	wTT7M9bB3PCSx699rIv8TmeKYm3Nu7rOGpTF6OAIi1FqlGbLJWra0qq5KXPL/szm
	iq5raL8zm955oiZU5KUNe0ZewwtiTXnK/Q5OLVd0NY1rz+F8j74KnkrAIV4QZG3m
	6vwm7iHcWYMpnJZ41wNh98h9Kh3KitiYALVw3GyESOC6go2UEH5O06sNH3WjZlXU
	BTlggqVvEpTN6N/Ot3iRaxjCrbJzHhuwf1rc4vUqZ8plBaBYKpYhfp/A5i9JmRbt
	TfS1xrxMDU5dlq3Ir3ZXGMTCoTWS+YajjjpXzOnxF8Lso3TaN3ZHSFJK9xzymC6b
	1saAtg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2s7rqbx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jul 2026 12:57:51 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-385d2703b64so2222440a91.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jul 2026 05:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784379471; x=1784984271; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IFNe/WToyK/O4NNvagSNqrPVSY/D88aPNWNMvMN959c=;
        b=XKr/pDFdZWNWP49L1uDsNlzM08X4NgrhyFoGjDpJ741tdDyB+tg376E4r445tmcOvb
         BeETSQW9rrH8imqly+70zJ11VA5fblj1cht1B7x27/FwDmjHzd0OyLRdLP6mGwVnQqP2
         oIT03kdRZBBWtST2JigSkUB/JjYxvI2u5T2nO2Y0h/Nd+TsXurDscwfIuU3G6TZu4Qzs
         78CaVYORVrOdWT3AvMafJWNislfh/wldRgpYmcTdqP+8KPfvhTcdac//VUiKt5OLFuFc
         syz+mElk21phA2ntB/QzjAurtepoh2jANA8TkNcJoq92lpadfs6yJyKRt/dqZLiWCDhh
         cUaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784379471; x=1784984271;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IFNe/WToyK/O4NNvagSNqrPVSY/D88aPNWNMvMN959c=;
        b=S0JAorDOvLUxMxu+H2wENb4B38xyHR9GBZ7GBIt1oGQHq2wW2kjM/gmMek6RWwVuhO
         c+g0Ip4Je+B3HgU2CHnylHa3ExAvovlNLS62fBW3V4rJh8f4RL34bMdqAgjAgZQbc4qW
         QU/688zSbz8rTUkdPr7u+L/WBN+LABm5dFlEzrCkLXZ0zl1bvYUu87FfyXdJpTlqoyza
         cMAjX6pGFtqduwJOKg/WB+Y7WuqDVnDeLwiJTOZi7rzyNS5AJF2xuXz6Aa8FYezxd5zy
         JZd6i+lAEdKgQLYApQqtsRSgivxBqcMWAASzUH4VCY5HsxWIOoAsqaZSTS2Mdp1j/L3K
         89tw==
X-Forwarded-Encrypted: i=1; AHgh+RonRkTxuzXxiENAGtkfNF4g+/oaJHBBtP3anin7w+hC45RV4903Ta1O+afjA/PwkbxL+9qYcwHcqfGupc0+@vger.kernel.org
X-Gm-Message-State: AOJu0YxnLQeog5rDym0mAWroPiOjJRFaGevyFLKBkpoSV87Tpr7SbUu+
	rLqmAWK1Kxf6seenFJwYGes/vcllE73iko6gqqZW8DkDTwywkMZgl4ryuDr2arHClj7u1jiuVNl
	2CRWkXyowC6pbYopFLRUEraTRnvc9egS2wMMP3zFWMwtIbq+n/ym7vk7ZTGlxTVdqOpbv
X-Gm-Gg: AfdE7ckEqtbZ8w+STHizKLFyV2s7j5dcfG9qUsGlNXzUFKe+V+h1nwJ+Dct//KKk+TO
	/OGFK4+sRs49qjEE5CR5FIJMyY6/4AqZ/JUahorrbYgVyUImvKdUDu0mx4a/x5aWO/fONOkIhwZ
	M1kMCkVWNF/nmHheNqwDwvaN3ESOCZ3zevcp+aBCrvqxcuKcebiFwQsjUE+je/Mtq52WCkXq0qh
	DlFmbK2EnA5E/0DcxlBMaCr+2YwPRqHyCzRJj+WSiLbKreyjRQGuTWesG2dJh5F4V+xRKWdYkZx
	5ZAiVTGipv9PfgMEEeE9XUTnWqsUi7q1+uM+s+lkQSNcwQMC0XiakCjTzKma0v/mDKcMTJ1fQbi
	j1daR67aFM+84JGyxI8f190psb1hd4Lc=
X-Received: by 2002:a17:90a:da86:b0:36b:4d63:4a93 with SMTP id 98e67ed59e1d1-38e3d21fc15mr11368447a91.13.1784379470483;
        Sat, 18 Jul 2026 05:57:50 -0700 (PDT)
X-Received: by 2002:a17:90a:da86:b0:36b:4d63:4a93 with SMTP id 98e67ed59e1d1-38e3d21fc15mr11368421a91.13.1784379470025;
        Sat, 18 Jul 2026 05:57:50 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2a18a47sm14238910c88.8.2026.07.18.05.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 05:57:49 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Sat, 18 Jul 2026 18:26:21 +0530
Subject: [PATCH v6 14/16] dt-bindings: clock: qcom: Add Qualcomm Shikra GPU
 clock controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260718-shikra-dispcc-gpucc-v6-14-62703e05ef0f@oss.qualcomm.com>
References: <20260718-shikra-dispcc-gpucc-v6-0-62703e05ef0f@oss.qualcomm.com>
In-Reply-To: <20260718-shikra-dispcc-gpucc-v6-0-62703e05ef0f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE4MDEzMyBTYWx0ZWRfXwyzvUdbKCy6j
 +TyKuEgq1ULgcvqVKjx9Y2VNGr//zj0qMr1L1QmQbDysaRdpVUpUf91qGXt1sp9+cWU/iydkcDI
 Vv40jhcIUSYklU4vkVfZXI7VYZngh6RePIzJ/2pSPleVeOB96RXCcHWWOm4fHo+hO3IEnhLL9oM
 Mwo3+czGmNIU/Sik+8cia8OmhAJYvHpkV5T+9YLpc43wQ+3t75D14/rOngyIeHiIlbhrdPqLFQQ
 ROGi/tSmhVuUVp0yc80NGQUsKUuK1fZo4yQaev1dj/bZL5jjCICfR/IO1aq9N+8YdJg6XEXhfpF
 XJ6MRwiEtcpNpEalK7IhI9i1vPGb7Fzx78mjT3JRHybI5ctOuHK3s5hE+fTLNoUggcIVJibV3jf
 IGq4MbJQSbxdZQlAFTlVrJ8BxP5Mcv2sX/XyeHfiT1qxIiQKLZSK4V3T4+FgyzCYOugTacabPcj
 OBX2M6AdctoyXxxptxQ==
X-Authority-Analysis: v=2.4 cv=eKsjSnp1 c=1 sm=1 tr=0 ts=6a5b784f cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=zFVXnba82tZ0OxNrzBkA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: qTZXHz6-Xi9sNQeht_jNcp_1gADcVQOn
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE4MDEzMyBTYWx0ZWRfX0eTRtCc5oJld
 0/Xq1/EuPiGbFHU/Savn2EyzrNA949ZFuBVuYYcqm+nabx+feLfoxT0sHUy8qQ8lvBk012dEP6f
 9b/DV81oYr3a2Cvz4LzU+3MQa+YxqoI=
X-Proofpoint-GUID: qTZXHz6-Xi9sNQeht_jNcp_1gADcVQOn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-18_03,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607180133

The Qualcomm Shikra GPU clock controller is similar to QCM2290 GPUCC
hardware block, with same set of clocks and minor other differences.
Hence reuse the QCM2290 header file for Shikra and document the
Qualcomm Shikra GPUCC compatible.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,qcm2290-gpucc.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,qcm2290-gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,qcm2290-gpucc.yaml
index bedbdabef67286afb6ce0a1ac53d1a9a15a01a92..ad2386190346cc10f53763e7c3b9fcb35fca8ed5 100644
--- a/Documentation/devicetree/bindings/clock/qcom,qcm2290-gpucc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,qcm2290-gpucc.yaml
@@ -18,7 +18,9 @@ description: |
 
 properties:
   compatible:
-    const: qcom,qcm2290-gpucc
+    enum:
+      - qcom,qcm2290-gpucc
+      - qcom,shikra-gpucc
 
   reg:
     maxItems: 1

-- 
2.34.1

