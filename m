Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EDEA2ECE93
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 05:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787634531; cv=none; b=LMVG419Gs8788N0nIJe86FzlbTYcVg0GnKvUJsKxJj+n1LFM5ZxCpjUN37HZsLCt4mmFPr7jgRXnQPdCrEUyy48wATPbB1bfP/bpxbrC7QhTrZgagNr6Dovprym2f5hROymIV4YXhbOuP3ogWOIiKjwl30tDvShFcXdaTDUgdIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787634531; c=relaxed/simple;
	bh=qBYt6yhJO7+dHZiSphodRC2EaEeWcgp5A0hPgNDah7Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SrhUQCKA9ApziEXekL5c0Ppt6BfQH7sFzDbMtdwh0ojW4zT2s7HW+imRT323X4NNNCev5pB6sL/WZh6AyZGe0kPiDJUFiGyuuH+/fP1qKPXNMK7nCcUEzfGtxYKhicIm5V0yhCeyWo4nJtp9XsZWzMryKi7i7SYJBG/0d5Znavg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eNZh01um; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CS7s8cjk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eNZh01um";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CS7s8cjk"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P2QsN2606589
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 05:08:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	82xy1Uf5ZmmpND0/4cvUbUKzI4CCdqyHRsPzLUg4lw0=; b=eNZh01umv4GdOVwv
	wCTXkPyXFSYWDH/36bn66FgXDWTY1XbSWM+fqLlqYheDN8fIse5m/nCj8AMIlzej
	uiKUxQpH5P2SDTJhZMiHVJ2jpZWukgpDipRREoFBewEsyxibF3jJlwBB2DXBts1K
	x/4RoQutqdVYYuV3j6MN879/cAKLlREruQRKrhHc+aZg9VFIg18IKDL1OY+zweR3
	ntdQewXqWZJBog2b5XOsyAkPBH38aywdaN1sOzkK4XQ99nK/VEbLaTtQ90L8T9w8
	U6KwbOW0aNqrGwCJ/fcKPRB7lA4ThwB/p2NzQGRQ5YGdLjCX8eYzWwoXT9aBACTo
	e4DPcw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8swy28sg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 05:08:49 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e1118e4abso7764413a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 22:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787634529; x=1788239329; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=82xy1Uf5ZmmpND0/4cvUbUKzI4CCdqyHRsPzLUg4lw0=;
        b=CS7s8cjkzm2ULrmq0NgpSDuHaGyZKKntHW4hHZdBFPWy1RECvg2FLz5rrtnHtIDGKd
         OMuTzRw14LJ8jGk4PAA6Xkz7k+6VPXCxv8JUWWIsA++0p0NyEzGfBxBq8wpalJJ2tsWL
         vtl89D/Vrn57drTtzzvCg9o2RT4OcBXWERsLY+gDVD+0MFVT2OHwhpiti8RqI8myBo1W
         Hdg/KsMEFUmqRMk0OwWaiCR5AY0vG6FgiB/tmgCa/RwRVC6ajTulxRVF0FkvfuGw926l
         3wLNTv0f+5F6x/c/9ODhQHHfBp4dq4UXuqGG4T/5UZJTtKHzgEo+qm7NtCc/3/TplqCc
         MVqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787634529; x=1788239329;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=82xy1Uf5ZmmpND0/4cvUbUKzI4CCdqyHRsPzLUg4lw0=;
        b=BYOQI8cGI/t5G1+LE/X+U/l04RiYQKqV+wJWpzwIS1EZ6+UFleOoW3o4JhjurONtEu
         SB0zwcVMRqxtcyRWny1p4i5xzjZqniSIJxbIybz9DleMLCs30mHCIewmP1g08bOuphbk
         NSJYb9NchIWy6/IgVp0ToLVSX3mL/UydZkS+VDD8ruyIZMoEodtm07fTDlTP6eC6nKEt
         7JEpcjFJ2bzMblzEN/3rNCpTvp0TkPI45NU4x5vLYvTyOhqrZ5gllnQgnZJSaWcmcFRa
         tJ5ysRT7czfkXS98+Sh+Ppp1jHWI4vqZB9jreCenJTs+V1Oh/ml5SNgARSNPtxll99ga
         D3gw==
X-Gm-Message-State: AFuF++lcWlHv4woGtDwiMSLfvnHu6lizPnDveDYX5gGjnuQj3TiyRGU+
	7wjkAje+dOCLhukBIreFEP5EasjDzTWlPW7PAkI7wz4okYUuauNIArv0DjkFYMqpbs5WwuUxnS6
	RWOthjQ+oTxvqBbZrVWwz7H1anSpeu10QDipiC84CgOFgztNBY/OBLgCRVNak9G5uNE6V
X-Gm-Gg: AR+sD12VbxrB1u4HQii2JRcCp8OmXEUOR8xwT/kB1N46eUHGQTji85rhpKPzEGpmeRk
	TShfUMuZqBeQyTGxmSTsY73/j+BQAPXhiHzzpGT1gFIdoF5mKoO1R52Bmg/A1DA1bmBr+xu1Hkf
	lVHrEMcvDrMnMcFPgOgmOzBxOkgi0trb8SDnODEDc4y+rgdMrCrOBdsOrogKx6l5URDaAiIFDzs
	6oVzlQt3hvoL/DFRINau09XWrkl/g1tvlrW8hyk4fBUyfUW+D3AVa3rAQ4FV/aS1pY7zqicLVHs
	COiz7kxdbvRAb/AgNiV3AjAqmNwQ+kecF8tHUFKukQkQuRhAmXR1g9aWPycmHuB4/6UyhpCQ8HP
	L+Wo9tHFUhBF6tWD0mkNKp9tijeorvlDbJV7Vi7vX3t1x+UO3i5VpYk+fI52V3vqoNBgdR2RNuF
	2hcaULzawKDRnaowcnAXG9Fzx14PPf/A==
X-Received: by 2002:a17:90b:5112:b0:37f:c22a:c188 with SMTP id 98e67ed59e1d1-395dee8a5c5mr47102550a91.4.1787634528661;
        Mon, 24 Aug 2026 22:08:48 -0700 (PDT)
X-Received: by 2002:a17:90b:5112:b0:37f:c22a:c188 with SMTP id 98e67ed59e1d1-395dee8a5c5mr47102483a91.4.1787634528264;
        Mon, 24 Aug 2026 22:08:48 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141860ec7f7sm32335970c88.6.2026.08.24.22.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 22:08:47 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 10:38:33 +0530
Subject: [PATCH 2/2] usb: dwc3: qcom: Allow the glue layer to pass ref_clk
 to the core
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260825-ctrl-v1-2-609e2291814d@oss.qualcomm.com>
References: <20260825-ctrl-v1-0-609e2291814d@oss.qualcomm.com>
In-Reply-To: <20260825-ctrl-v1-0-609e2291814d@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDA0MSBTYWx0ZWRfX632lGhzr3uCw
 ApUDB/qZeK1+3MQP9K6RqJ30EmpsSdoarAIccntj6Q0OmMmwv8sRduzX5BIemEoNEv7W5vDApNm
 QJO7x1n+DX6ThRA1Tw8XiOzX0NKcxRCAebMHG5db8HrMi9S4581Uo13bzgRMKJf9jaH5kuYZL05
 9Cw44UvkmFjlSRw+qApil4UtXRjY+QkiPFNgavETdjVDBntXiCgZjM9nvOSSSXoNVoihkp867FA
 WM/fEy+Y2/7HqoaAdZ96w8xML+DpPQ++Jy7aPpIbutI3XtzJ7ZQdyI3TZfF/Qhk+lFP0rSoSoEJ
 Efa37ufIBeYDJuDBCdzRZCBOs+uyIsQt5LWFkjiea5Ua2Zgwp8/nbbAjB8HQyc5HgaEf+MFBpSq
 91M38NuZ42e7FzdlRf03c1wgHLv8tCQsgHz4saBxiYKZngl+gi3DP0IG7cH3ljOYpHiZdeJY9Ye
 i1Be9432B++zDyGDSvw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDA0MSBTYWx0ZWRfX8Oc45vJ/jhN2
 bCQssWoFy3frzreqarkfUgV183oqJUkk8t4saykU2mcGEjXvlTPHr/gL+GCkz25aGV3rDGBBeFQ
 cWNeq4ouIEsTxRnSEvL+nzAAAOl3jgg=
X-Proofpoint-ORIG-GUID: fe7AsamTOiyFut9vdY6HXs63Ps7_3Wcc
X-Proofpoint-GUID: fe7AsamTOiyFut9vdY6HXs63Ps7_3Wcc
X-Authority-Analysis: v=2.4 cv=QIlYgALL c=1 sm=1 tr=0 ts=6a8d2361 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=nsXwHlzZWJbxCLJ-4VsA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_01,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250041

The dwc3-qcom glue layer sets probe_data.ignore_clocks_and_resets before
calling dwc3_core_probe(), so the DWC3 core does not acquire ref_clk on its
own. This prevents dwc3_ref_clk_period() from programming GUCTL and GFLADJ
from the reference clock rate.

The deprecated snps,ref-clock-period-ns property is not a suitable
replacement on IPQ9650. Its 24 MHz reference clock has a period of about
41.66 ns, while using 41 ns makes the calculated FLADJ value become 0 and
leaves the reference clock configuration incorrect.

Allow the Qualcomm glue driver to provide ref_clk to the DWC3 core for
platforms that may need it.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 drivers/usb/dwc3/dwc3-qcom.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index ac68b4218b56..2d6de6469c1e 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -705,6 +705,13 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	probe_data.res = &res;
 	probe_data.ignore_clocks_and_resets = true;
 	probe_data.properties = DWC3_DEFAULT_PROPERTIES;
+
+	qcom->dwc.ref_clk = devm_clk_get_optional(dev, "ref_clk");
+	if (IS_ERR_OR_NULL(qcom->dwc.ref_clk)) {
+		qcom->dwc.ref_clk = NULL;
+		dev_info(dev, "NOT setting dwc.ref_clk\n");
+	}
+
 	ret = dwc3_core_probe(&probe_data);
 	if (ret)  {
 		ret = dev_err_probe(dev, ret, "failed to register DWC3 Core\n");

-- 
2.34.1

