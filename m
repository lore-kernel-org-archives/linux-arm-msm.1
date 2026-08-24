Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A8041D11E
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 11:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787572554; cv=none; b=TIk2+/5drXuEWeiaU7Pxf/p6W2FywnoEhwfqgkpchTpQP2Iwj8Rs+tt3dCOLAO1NjUSiC7xQWY49EUM/EI83OkSpxhG+kIgOrYvA1k2VEV5owR674a9tpgxmyT2fHoUc3Uc0Wva84N3Qo6bwKSz0M6VYNUNNw+APrdHFaODlLlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787572554; c=relaxed/simple;
	bh=lRVKUqTPpCGIoNz5KBJv8zuvxjlzgnhVsGKzfTzKUPs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MQVHbUc2kmL0XuwVhKLrBhKoRxzUbkA63LC5fV8QJ9A+PL+A4AK0t9r3P+84GJ7cPLCtzHiEJ5kXeJT3WrjIGawwh+P+/YkIrVUi3RKbsuKryfLstWDlNTVkxDro4qDHiuljgrF0O14RG43XHOtpuBcFek7YUFtR7vrMNqL4xPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BbDwN4Jh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pg5fwMlM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BbDwN4Jh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pg5fwMlM"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBMLx02274678
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 11:55:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/1engMRsfjHWG34qUdnnA7Naj9ZgncmLB5UQD0m4jII=; b=BbDwN4Jh+Vsz7xJO
	umA5bGk57tpH3ZWZLGMOraj8fpEJa1pTm6OMN9OyQ9haCUEAdVWz0Fo5qLSpdbmH
	vQz2TqJXpmGVBWXMSQ2EKZMy+86UtWYxA7oQIO2Uu6PlFlsztoHD3km0EU78hj5r
	LG1JMGhfRcM9vnoVCmsR873NYNrOxUt80bdYVzdKoIEeUR26IrIDX/ZFWgslqLRZ
	YG7dF7NEePEfndOI1WjuPM9z34fBF8+g0oBlJTtM+Zukj79AXwtRAY3bF9g2ZkUP
	PPU79Po6Y/xRX7OofI7baitad5/meBqMxNBJPN7r8BobuUHd/kGjJLcDZtQYcZGK
	jdBrOw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8kdsgfkb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 11:55:51 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52ce3c7cb2eso65044441cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 04:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787572550; x=1788177350; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/1engMRsfjHWG34qUdnnA7Naj9ZgncmLB5UQD0m4jII=;
        b=Pg5fwMlMvIvoBBo/FOjjPoZxl23XgxQz8wPBrtQ5QUB5XyGJNbjcDoJrHqSJwwtKXC
         B+Fo1bYLFh61WaUXzBFbRwkJd/U1+6bGY+DsLJUIwat4lcj5GOYmYo2GHo3OEaBfKivk
         RUaJtZfY9ORNFZItfoEEYNooqUYfkvzty9gAMzGrYzHkW04H5jGnb0D4wzSTh01IacUD
         dQsETN6drHucw2wmrZGZc1H7qxl8Ah5LNF9418ibEcPJGQxVtRXebFjk18Y7lcYeIgkk
         BiY6vLEjMy2oVFbadB/5A6PvOY8oP3swLl7Fgv5O5ZmtXuWvCXktFCJh+G6L6rmz2YFg
         TM/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787572550; x=1788177350;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/1engMRsfjHWG34qUdnnA7Naj9ZgncmLB5UQD0m4jII=;
        b=KhE9eCyaoE8BU4/TgCaaZFSe9iAIK4KpAxgLkodESNZ5UabB9n7Ar+SAwr/hIxUakW
         m0NlTz1pWq4Nsf6wjPdpGt9X6Cf1DDtkw18Ra3G7MhYf8Oc9riOjv3nGYF2Dr7gTZOcK
         jf6XRL7qYWcWqqQo588vrubeEF5mNgYaRqztVysYjNL9+6x2+KvVR5v2uB/UDBIYhEuK
         ESM7QKNCTI/DrbHSx9CqOTW0G9ixdjAZK3Y503fpEgFD7A0jw7jdBtqJf5wTI9Af9UIP
         DnDddYjXZPfHer2ubV8uE8q80xli1cPfhUSU3nbXgJZlJrVB7QozqI5/kfY40ouODl1S
         LVzA==
X-Gm-Message-State: AFuF++mpRvpzhwdNVf6jbSg+FPTOEYCmcNVB6wboP2JXDOvi4K0PVq4w
	j9IkKNptBHF8i37d4u7UZO+K4/gaOht9kLcla8CSRcz6HoFy2E0Xcl/klTq5RHaGO+43v1gpCoT
	RvEFlNVGr2TREfD7brgpcZTiYseYuER7NB++mzaOcKM8CILBMHIVEss/X2a/vGwDa+VOQ
X-Gm-Gg: AR+sD12qpNdJPLdnTQS7lRk2TF3r3qAROq0fuBqJd0W+tEYBBSEad6qvmuTtbx73/nl
	L16yKwE/lxnxKajGSeG9QEumBQWyV3e30+Q0JcFJrBqnHtxGVNbtDIf1kjFmX6YKANlV32veH45
	v5lSqD3Oa0+NQEmixLiCUNgOWNGxULeZAgQDE2Ud1EBMf0aADj9eGBwXf9nkSXPA+leSyMT7h8U
	9iAz7xMi0VQ9K16f49z6XrwuUJTuIS3Lvw6P6kiQPqJ+I3ZAgbZGcTBMCX/ZdBZhuuIfRCSceGn
	kLOynFYalH+eLIIRiAM+P1QH3ywqs8sC0V+dZIS91RPSGahoayjr5TCeL2KJ9WESn8dntqL/uE8
	Ymd9DBcyj
X-Received: by 2002:a05:622a:1456:b0:516:d83c:edb6 with SMTP id d75a77b69052e-52df5692459mr239121741cf.12.1787572550394;
        Mon, 24 Aug 2026 04:55:50 -0700 (PDT)
X-Received: by 2002:a05:622a:1456:b0:516:d83c:edb6 with SMTP id d75a77b69052e-52df5692459mr239109021cf.12.1787572539399;
        Mon, 24 Aug 2026 04:55:39 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249629563dsm1259990366b.17.2026.08.24.04.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:55:38 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 14:54:06 +0300
Subject: [PATCH v3 19/47] clk: qcom: gcc-sdm670: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-qcom-tie-cx-to-gcc-v3-19-f1205a92682b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=756;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=lRVKUqTPpCGIoNz5KBJv8zuvxjlzgnhVsGKzfTzKUPs=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqjDDnH7t+SC8XBiIl0Utyfmfs5AZfqP80p+fUp
 +5xic0k/WSJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoww5wAKCRAbX0TJAJUV
 VsX1EADFq7yn3f9PRnVu3BXzqwYP0Yc5MVfyCCURfA5sC8JpIcx4kH26rUc7S9arKDjM9PLCo/I
 VvzSIQqwXIP6bdokrlApVa+V2QgtmiGO8mRE8ExEfljso1GSugr2d+Jv7wnGn/D79lS0dc+yY8g
 a/sACixX/P+/Bw/79htVp4M/MAkPW9xgXwsG/ORkXMi6muJ88dwRUUrdMUSHCiFbRh8Y+6Xo+jU
 mdjNG1M4lUwGQHhAIxe2WqstxTAfrFsqZ1wJzoX4LC5HzVhYEGDe+Hqkpn5/GGFRnAGYOYOdJIM
 AOAvDtixL0CWjcX3bbGfps94l5uML5q21wweB6Dm4Un/mnr8EmyOz2aPFA9ToBQXGMymMIRjrxO
 7Lztluoi8p3d8GW//sEkv5PkBjrp/4mpk3XBDqSMdPHyE/wPEydEChsQ7q2gkjNMIsgmJhRbb61
 +y36JuGBgTJAI66XyjZ/IVISLsTCEaNYLitErKnUbnfAOwb2XPVWheXxWOAb47uM7c3ru5/f+oz
 +hTx0cg9mOomyL+H6Z4IP81b1/DcQ+XJRYyBosycpfTC/G92GC1zN+IM8fLf5BIp6hlrAXZ/IZj
 0HYriEHnhiRh3XJm3Pi/cNQs1NUiT2Q+lO5JHTVYy8nkVhysN7HQFnOQIl5eaTKUDoJ0vWNxLIw
 WYXey4UsL1mKg8Q==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfX2KPlTLbSiDFK
 TdH6kt1nEHdwX+u++IrW+b0iXtnippgfC1wNHoImPmnaCXg4qfi0tmpYZnefKpyjVsbKcEqga18
 H57CbW/e0Khv1eku/d2O74NrnIyrt3o=
X-Proofpoint-ORIG-GUID: u3g6NvuMK8ZQRWLB9OUy9V80PJMFwXm2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfX7SC3fLSKUwqB
 SDNmlJSNN4DYGhxrjaK7ydkGrTlSu5rJOfphajk91B1w1ga6nBRIu1uHwfnbr4PntuukSthBVWY
 16DCMSDk0e9Yxsd1g1fHYMeR940jHuas1X/RzxBXbecyv5PKJnzkKJm180GdL/+yTldFV2FVS7E
 m7HP3ehWWhjZspMz1sP6rGiDXIcok7IGzH2mg/3hnnI4AHxh81Ur/d4HXROcDZ7h5gvrHVdfpjf
 3s6Pq21ByeyiT0PcWJ07zV915v9QoXcxlN4iGRY50Fbkk6Q4cgHZvmzPDYfAQLSI3HJO16X0y8k
 dmxGRylBeF+xS8ZZ6O+5t/gK5KKArW6+KVyVVS83Lzdbx2Xo4Lu46bmMpejoXpxle76QQDmZJXA
 XHBzvaZ89rcdjPAgQqJY6QyldxN4xycLG/W+LaZozPjmNcTFBUfziCwLqFJrxIlgUggVSQ9sg2F
 pFQLUSrqUheBT9/Sv8A==
X-Proofpoint-GUID: u3g6NvuMK8ZQRWLB9OUy9V80PJMFwXm2
X-Authority-Analysis: v=2.4 cv=d8DFDxjE c=1 sm=1 tr=0 ts=6a8c3147 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=j9QDv7RGPiaZsbg0A-cA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240099

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sdm845.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sdm845.c b/drivers/clk/qcom/gcc-sdm845.c
index 6d0f9cede5cf..57d54b45fa52 100644
--- a/drivers/clk/qcom/gcc-sdm845.c
+++ b/drivers/clk/qcom/gcc-sdm845.c
@@ -3948,6 +3948,7 @@ static const struct qcom_cc_desc gcc_sdm670_desc = {
 	.num_resets = ARRAY_SIZE(gcc_sdm845_resets),
 	.gdscs = gcc_sdm670_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_sdm670_gdscs),
+	.use_rpm = true,
 };
 
 static const struct qcom_cc_desc gcc_sdm845_desc = {

-- 
2.54.0

