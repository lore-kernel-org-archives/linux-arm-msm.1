Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F30F416860
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 11:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787572532; cv=none; b=bM5DTi4St2c1US/cz2pZA+9o6fW13eCu53weZkIk+6hnJYPLBgzdO1/wLDlgV0eQVAZ9aHwGALqG2WSBHYrkYCjCzV4WSDUf11YNphMz8MkYOAQa2SMVe6Hlg7zJC+CyfxWl+Qyt6Df2wza/EbcxVZHFSwtYaXzgS5+WHPgG7Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787572532; c=relaxed/simple;
	bh=rlaDdwuN40epUY1QhKgOTaP94Fc4GH3BVIniMJyBXrc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fdmay0uAG0wC4ngDya8kCR3n3Dlyige04UB3SxPudsx5oWWrDZkbtQBizgL0c6Opr3G8F3AcW7eJn+utEVlRG8DY/CuYoquJZcftkG4y/ncOeh3Mi9p+RJj43fNXSA40fNllShpileUjJCoO4FeRnqOemzpmk5hcKfHjR2UHxNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eCZD6orK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cStyNrKl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eCZD6orK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cStyNrKl"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBMfqG2864672
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 11:55:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JGKiNls/ELbeGZ11s8HVW7d3CfdpdC6kiFVv9AK7pzQ=; b=eCZD6orKtKTiR0FU
	HYwrXEJWiynf3dDT5oIpSos3x9QFZwqJamGsNL76r3MOp7OAh3s1sV0X/xdaccKH
	CJ0SIu78KKaEzD7V2RZPffnn723ZB9V4rpSCgBkTYOfQBuyWuGztPIfrxT+VSLQa
	50YbzjVOewyupd28/fiHDJPLn4euq3i8EdVD2CD/oKXsl4XXzwBN4hCevVbZWCqU
	Mq1so5HFXJf4hITLAmc1VCiNFQoW8ZT7WcpSZYlQruKB1OqqccrrDWF+Qd3vZeoK
	5f5Fw9ffpE/ei7AvoEjpZbXEIsDMjkb2W9/dtdib5I6hyLfaj++HIQmnTVYso1XA
	um1PoA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8bdr29ph-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 11:55:30 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-90410c668adso30513006d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 04:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787572529; x=1788177329; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JGKiNls/ELbeGZ11s8HVW7d3CfdpdC6kiFVv9AK7pzQ=;
        b=cStyNrKlJeGUrGFEWMVZDsudd9Gw9bo6meQnoh+V6VLO5vmsLa56pJpSrYW5kfLrIQ
         JsC5PiOI7q5KXec3NkCgZXLwSqbs1B4coFfy3jCnsL3VDFMAjcb+w8QmBNFbBYZKIxmS
         vTyk21zzuBEXGstaTMzYvH4V2hVn/8eMb91JLXu2Wg/bKxtgn+yGZXsfRTpXjnq8URXa
         xIzLOk143bPZ7u+2vNJGPAxmQju5MmeyKfJ0GH6zRZEdo03zsg2S+D2ycgyhfBTA+HsO
         AmP6+cCm7m/tGXGVwAFPD2illFB02Q/SKZIUw5I1g+ljjVfNs080jiyBir1npchmeUNw
         bxGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787572529; x=1788177329;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JGKiNls/ELbeGZ11s8HVW7d3CfdpdC6kiFVv9AK7pzQ=;
        b=kPCHBVQriEcLzsCM7rG8hAT+WCMRof+qcV+TrwCzRKMPUrb+fOUZ/M5T7lHSM6ieCi
         iIJ4+oyv6Usl1/Dv86itOYb4VpjUDjZdOxAE+U/pvt8qIiG7TJn0+7rmFL0ZQH5KbDzq
         F4ArhuXrHkDi5oCfCM7BvoP59RK9UDBJefzNeNKSrtp72SzOcfo13SkXtCsFiP5yZPsk
         dm7II5EZyPFfXXSo948k8Sov7Ww2YirG+s5+D888JKknDfXzUD7+15yLhso7ynBh1AcK
         R3ahy54jkCmdxi83LHt1vPYw83HhaIR9cCbZg9GXWVA5PbhewVY72NSWB0n57g+Q9xcf
         RPkA==
X-Gm-Message-State: AFuF++lt8u9OlgSpk3JImtMWcHa9fPkwdfYqEMt0cRfbZRDA5b2eyJcZ
	JiO/yJfsjyZ5S0rh7KWt1+XPeuetIN5kgWOFozlCXpJ1hHlbZ4C2wZylO1/G81UvFbl/zcEJxwl
	V2ISu79o//VyYdAC54R5GWQQPq8MrMCmZgbobeXHuUrApeMbxQI3ZTr8ixeKa7jCIioV7
X-Gm-Gg: AR+sD12DdElQVSQotkns+L0N2Gq5R4aYu376RduY3Ac5TjJyUrQ4SacQ7MgdOC8WBmA
	/qM6ELHI62Ckl8BFTj/bzfr1+HTVhdA9UgbxOM0zxwo1uwjJfSUca6hhy6DojlR8qUzh0EGqSFS
	u2zwFVqILmXCFluxd369GfrwFGcc/SjkbaSqVqiYb45qF/SRBPjvHHCcq4wzX9GuI3qWYlJCPqJ
	cu07CPN8OGpA7snXigLO0JdgQiIk0JxxMTb0FQhHWtG5ThsvZCKm4/W0djTGVSnUOHbPQoxKyPU
	WhG1TFUKV/JPcUm1A8rinhqQnhCohmOSvtTPR+L8a9vQYeIvltK7p7hIBIVXUGZikom+JzE7M0O
	Bbph5MG+a
X-Received: by 2002:a05:6214:5906:b0:8ff:6304:da9 with SMTP id 6a1803df08f44-90c809c34cbmr273380206d6.6.1787572529438;
        Mon, 24 Aug 2026 04:55:29 -0700 (PDT)
X-Received: by 2002:a05:6214:5906:b0:8ff:6304:da9 with SMTP id 6a1803df08f44-90c809c34cbmr273379516d6.6.1787572528816;
        Mon, 24 Aug 2026 04:55:28 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249629563dsm1259990366b.17.2026.08.24.04.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:55:27 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 14:54:02 +0300
Subject: [PATCH v3 15/47] clk: qcom: gcc-sa8775p: Tie the CX power domain
 to controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-qcom-tie-cx-to-gcc-v3-15-f1205a92682b@oss.qualcomm.com>
References: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
In-Reply-To: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=775;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=rlaDdwuN40epUY1QhKgOTaP94Fc4GH3BVIniMJyBXrc=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqjDDk9EKx2CK+REMhrD15CuB1Bm0YzdBM+len3
 KGtgx07HGCJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoww5AAKCRAbX0TJAJUV
 VrgZEACABx4JeD9/rSC+xgywMg72QE0Mv9tc0EJdfy+KRkf1NOZfMp+gTdvq8Ycmil+o737NirU
 jkKZar3dESkBSmg/Xu0VYtNX9U3yM6Kf0LEiltjTdZhR8bLyqUfuUzixtJg0DVQwJfxRk5Ne5NH
 Zd74qH+obCn7cCo+ZwkKPXF2tfxSRiB8M4PB+4OxF8K1u262s6QOAOm/XFcvUX9mwI8iAHRpcS8
 7+FSPDHmbWN7QwsyvRXKlDvy4hE5ua+vnhG/P86xoNmrEl8L05EyCq85o8Hg+eJ7aWZrurYKXwR
 YTagveswuGtT77LkOVFbLkcG1kg085jcLbJ/jkg10r8HcXAjF7z29yQ5HvaYnuP2fseAq836dml
 TbFjjH3wc+phIzV96oThl349Bk16USWQIjHFjwqFVwcV6UPOUa+Udmp4gXp3tEP3CkOHCIAR3m3
 fpgCV7Sec5fwr4jzXfH+rq68eCh7axzrB2LsJxmRVTzVQT5Lx0Ob4QtnLCv9hF97EzcayWQRnVZ
 3pXaC2mEngOI3SF5ZbSGKIvf6TMpw4D98o8DY2DkDrPfg26k6/D3s9cgkx7vAxBGwffBRYKgE2R
 D3eOiGTHX1PVSi69Dkf51rYRfqPIKUOcCc8kK+uukz8c56Viv3YbT32tr/cyRYp/1D+78xWDg4n
 KB7pb21rpW1r6Tg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfX78GjnVWBqaoF
 sK3CZTIQMyXI/N8WS7e/weY1FMVLW42iX1GVXOSiLbr+NA0FEqqAAPafo5nUhXSWBgtgdl4tWLo
 +/DMISFVuc7/GL+rLwY4rb8U79EhiygoxU2k/Mjm5aqe9Q93Nh0+GhHhr7867mRaYnB+TfhRMR1
 aMotj86ZsilsOgqdTV4ZiSfQQwWyjXT3K4i5F+Qz7yLIMwk3bxMdi0ZjroHUFYfNb2+9h0D89qN
 wY/vr5MM3HbZgVNfVNXaTiTn+5QC9eTKYrK3duumaKaOXoob00SrmLp+FTVMId3qCMjOfMfMlFl
 XmbdyBN1TDVBVtRHRi+3fVbyvJvzjhGNvZ/nvXJzFudtNjfT44s/Q9xbT7gYkfilfZb+thTFbHt
 6ELp1CB2RLrp4NBC+/gGLo/oEyA8Qp2XggSBAKQWPSp5VNoOyW0oqlenvvO2NM6xXlGyneL7/Sa
 H8V9G66/4OkR6LvitJQ==
X-Proofpoint-GUID: gvzOhIbKQbYj430JVifn2E1U55TpliE6
X-Proofpoint-ORIG-GUID: gvzOhIbKQbYj430JVifn2E1U55TpliE6
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfX7cT04v50nNOL
 hfNzHidKiyhMOcR0fKRtdNUgEf5167VuVZZ5jemQJw9tJcHH0CAKJBk3KEEKh54P9aXgDMtOLPc
 rNix0pTej6jZne2Kqlz+LZfd1/hsnzI=
X-Authority-Analysis: v=2.4 cv=W8cIkxWk c=1 sm=1 tr=0 ts=6a8c3132 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=j9QDv7RGPiaZsbg0A-cA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240099

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sa8775p.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sa8775p.c b/drivers/clk/qcom/gcc-sa8775p.c
index dca316decd0e..2f867596bbc5 100644
--- a/drivers/clk/qcom/gcc-sa8775p.c
+++ b/drivers/clk/qcom/gcc-sa8775p.c
@@ -4652,6 +4652,7 @@ static const struct qcom_cc_desc gcc_sa8775p_desc = {
 	.num_resets = ARRAY_SIZE(gcc_sa8775p_resets),
 	.gdscs = gcc_sa8775p_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_sa8775p_gdscs),
+	.use_rpm = true,
 };
 
 static const struct of_device_id gcc_sa8775p_match_table[] = {

-- 
2.54.0

