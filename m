Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B206D3B6BF9
	for <linux-arm-msm@vger.kernel.org>; Sat,  1 Aug 2026 17:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785605509; cv=none; b=YgY078UBq2bXYBG1YZbaKA7cz+3buFKMEbDLk26WqtwFSvln/S5oeK0IFZ+xlzg3Fh+e/Pd/xcNLmFPZ9iE4bCpkNuWOJGLchooRoH58rPHjwA7Fy6ZX09A+lYGfRLnxiXaod3rjtV7UqcqjMcCGJU1HRpDfxoDf01HEUtwUIUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785605509; c=relaxed/simple;
	bh=H1mNg8gEHpjeg+Dw29F2Ce5I2PQAD2Ke3CzBqgLKtVU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f58uhlgrT9AhLoFg04NKhxWUiI15GmMsWVu1rXx5C/R8FeQIcRdzwU4Gx/919kN9UgTFwCSe4C+NVgYNiJe/tYYASKVMoF5eIrdeA2rmvEUGZQ+sCbwxS6YGk8kGWl7bDqSif63OlXglks5UUh/OQWYCp1/1U930YxwF45dOLnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L2Ud5j7i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dbp7xdN6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L2Ud5j7i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dbp7xdN6"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 671FajxR3592150
	for <linux-arm-msm@vger.kernel.org>; Sat, 1 Aug 2026 17:31:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O51Fgg2/ZbyK/CWM7sBEU1xDckvgir7LEKryAan0C8I=; b=L2Ud5j7iSV4QGWb3
	GuYtQiw6MN3aALKpKTyN6VgzGcOcAH6WroPBQ8oqXoI58gaWaeRPwRneRBw93CIz
	6k8wjXb1lFnwfYGWgoZG/eZ7pKRiT0/RpEN1U1TOdYn1OTJhE0zujbmOhIGErRlo
	9LvTyIp2DOA2Ld0IuFhQrKn1HK/Ds7AYD6H5t7v0uh2JX7Xtpa/bk4Dg6+h0zFHl
	b2P2E+cvSifQJDtURzS3psX6QlL5/xiKZLfadmUloMxbYYlTprHZ/7dH8oOAazld
	Q4H5saJTj5BCRY1ZQotsmdU+jXwc3YBRxzt23Utx7J5JUAoEZwDIaTEaLbuAbppL
	/xTPfA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8tx1ddh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 01 Aug 2026 17:31:47 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38ec0f510a9so5061438a91.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Aug 2026 10:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785605507; x=1786210307; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O51Fgg2/ZbyK/CWM7sBEU1xDckvgir7LEKryAan0C8I=;
        b=dbp7xdN6XPKuICO/yl/Ai0VjvYk9rbl4NZHwaV54PXhwOCtO/UC/t9/8AxcJZwgn20
         +Pag8v4JFy7XFnUfQDG+qlaB8tl+MMOwus73C++0QOl6J5YRH+NyDqLA/3GgYg7kRa+o
         +JSaulJDVaIcM66uNZCLU4BjhpOVC9Q1IK4MdzpNfEyszKpMFsdje1NV251vb0hT7LVS
         bCo+SwG0IIJ8lSpUyif8wpxzQDuUl/KL29ZNq+uJXRVcpQzhRxn43fyexijULzTqC53x
         mUeFPgitrmeZPf8OklwHL8Vw+nr/q2YmwzK3N6rvK9pTc8Ge7UXfTq2y/TQiSTIIDFXL
         O5gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785605507; x=1786210307;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O51Fgg2/ZbyK/CWM7sBEU1xDckvgir7LEKryAan0C8I=;
        b=hCWcGjNHFvpGQ1jxwSm4UBvqhMJ0K3Y1E9EIpKv/WRqGKTo8YyqeagA1gXqocKXXY3
         Q7KzEL5J0CFJ0eEvk+i8SlUZUNuFCoVuqWgyyDVC97gnDUEGJ8iwkOvx11r0e+x/dXZJ
         bX1IlckDdKJ/W+p8U7bWwWgEHxQkFs4q4iXXshVzR+qkZNQ0xqq+AEr355CCe3fyhm4D
         6y25Q7ySBPfkH199/NBC1As/RNd+o9FkZI/rLWNP5PXA7fQhke7wmlvGOJLU1pZ59mHC
         7Bm9zLOk7SyE+Mhq7nW9TsDJPnNEqiwm+MNzu3qIjG+6noeLHxho9jWzcni6gW5Mezq/
         zSQw==
X-Gm-Message-State: AOJu0YzafabQ8taRVXmirRcHQiIR8sQ+HsfJlE8KJ/VEtpII8pnH7elZ
	5RJ+7aX1kE7QH0ceQqhRM98yjKpZCGKJgYqeJYwydSzoQrY0sfJVchEofVzE1NaqhkSeNr9Sjud
	wPEq4oyAKWP6ZRupOcQPfbQse2DMIjfSixzHxmJuVMOyxX+i5v1gDWSxaN+UPy1nF0qrI
X-Gm-Gg: AR+sD10mp/pQeoOLkEb9S5JXHB84XFfYxgLC4iCKW769gkzKMbdNkIMM7PD6cpuJYqU
	a4l1FqLyBDa21uzWwXLsnKPoCaTibBnzmsLOwN/ev1yxH5zDHR5Z+NL2nCc6HaBFN6B6E/5k8bD
	0v8dBCZ+vOIU8iUNz6uocu5SWiAflC4rCBNfvGohW49LZrfajrWrhuTFbe3UAts98S5RMTIb0qq
	TkvqDVnG/d7b1iRzXkTwkmj+4Nxj1fOXfyns1CUeuc7b0unZy0z6XArrucrkCa7pPY/MFulrvaP
	fwXGV3g9x/nV5YPwnbCulszDMzw4hkbZl5ZUkY2jFUe1SGtGQZH9XyJMQSBTCQwe42DFjXRdVtp
	HVU4a4cK3rUY8qWYPAunp8XRT
X-Received: by 2002:a17:90b:1b46:b0:387:e0db:3faa with SMTP id 98e67ed59e1d1-38fbc560f00mr3142326a91.35.1785605506646;
        Sat, 01 Aug 2026 10:31:46 -0700 (PDT)
X-Received: by 2002:a17:90b:1b46:b0:387:e0db:3faa with SMTP id 98e67ed59e1d1-38fbc560f00mr3142314a91.35.1785605506190;
        Sat, 01 Aug 2026 10:31:46 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab4e44bcsm21865553c88.12.2026.08.01.10.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 10:31:45 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Sat, 01 Aug 2026 23:01:18 +0530
Subject: [PATCH 2/2] clk: qcom: gpucc-kaanapali: Mark the GPU CX GDSC as
 votable
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260801-kaanapali-gpu-voteable-v1-2-fe804d24d2e9@oss.qualcomm.com>
References: <20260801-kaanapali-gpu-voteable-v1-0-fe804d24d2e9@oss.qualcomm.com>
In-Reply-To: <20260801-kaanapali-gpu-voteable-v1-0-fe804d24d2e9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDE0MSBTYWx0ZWRfX/Tm0G92Pp/pE
 JTdzXdQplolcxhkupXGMWcGkzIH1CVyGANIDOlGzqxF9asKGPtlqQOy2/LerEfr/OU3bUC+2JYc
 Q3yehYuivlqwzjUwmwqOQgnjfFhryoVEwSm8yoATveWybEN3Rrsa7O2Ia490RaoNz1TJgPBsnB1
 4SQdaPilhAvqQIjNjnfV7JDz/BLP8w3Bhqv+SIIM2Cu0TxkhyDFVUp69x7UkrJoT+ZaQRZDHIXo
 ORusXLqz2tqjtggx0s3XW4HSS331BvO/A21u4Z3iV03VG1lYzT3AwhVMl8rwGXNicW4quYhksEr
 7ZZlImgdTbt60xkfmdF00qgRAsx/RazZi0Vh+tuQSEpQraFpalQWBCxye4edZhxtKgoDTb7q3SK
 i2d+qUMoQhFqo7OVDbDb5nxc4noMYTuBlM1v7iIL+ygBZBLtfgYHE7yUTazE7+izYms+7Y5Dyyb
 6d/MTYwlBPk5ZDqZr8Q==
X-Proofpoint-GUID: 6-kwY__-BTOeUHtn5JXnsZPwO05lQ5FF
X-Authority-Analysis: v=2.4 cv=T9C8ifKQ c=1 sm=1 tr=0 ts=6a6e2d83 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=1GDNdKNvGV4VtvgizQsA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDE0MSBTYWx0ZWRfX1QkYWguSIZbF
 q2JdQuJumVNfvR3QRp1rd/vGxU1NfJXwv++3ol7rfyYgRRV1RTpkOt7DQ4oQ5YaGLcwigxeyQcf
 BuDLDx0ycAHllAaKUTt/1s43U7Jie8k=
X-Proofpoint-ORIG-GUID: 6-kwY__-BTOeUHtn5JXnsZPwO05lQ5FF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-01_02,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608010141

The GPU CX GDSC on Kaanapali is a votable power domain and hence
should not be polled for power-off status during GDSC disable. Also,
its power-on status should be read from the GDS hardware control
register.

Accommodate this by removing POLL_CFG_GDSCR and adding the VOTABLE
flag for the GPU CX GDSC, similar to other platforms (e.g. SM8750 and
Milos).

Fixes: 685ec348339b ("clk: qcom: Add support for GPUCC and GXCLK for Kaanapali")
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/gpucc-kaanapali.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gpucc-kaanapali.c b/drivers/clk/qcom/gpucc-kaanapali.c
index ae5563e516f6770adfcd52252a1712dde2c80b9a..f75f2caa2205c4720f7510c9226b4f91a5403d52 100644
--- a/drivers/clk/qcom/gpucc-kaanapali.c
+++ b/drivers/clk/qcom/gpucc-kaanapali.c
@@ -380,7 +380,7 @@ static struct gdsc gpu_cc_cx_gdsc = {
 		.name = "gpu_cc_cx_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+	.flags = RETAIN_FF_ENABLE | VOTABLE,
 };
 
 static struct clk_regmap *gpu_cc_kaanapali_clocks[] = {

-- 
2.34.1

