Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C84477E40
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 23:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785455659; cv=none; b=qGt7niCPE5b30Zq6PBGDEhotjLR+18mneOEJeQzyUMXBhhGnfoXZTFFAzekgpJnElKqeBDVN7/9B8phvWFEFsl7W3H9rDv2r6vlkZQvZGDQ0jlDKRRL/Qvx53hE0UAgSIAT0J1NeVWEFQPiqGicJicD8KwNDZS1e+B3/dprJ/XU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785455659; c=relaxed/simple;
	bh=7KJFUkK3IqBdyfiDVBbWS5wZfeNsRT8SMeMXT0iYUtM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TwBLrf4eIj7QfctOVq0yFmtr9WJ86s68w7Ic83v3MCLDEWObpl7hb0EOBMI+HJKBrYFAgDxN31uOsYaRz1hWREiBTZHC9+mGSaQQCBTU9tfDghgcnmrx59bXFQvOJfVgYdUqJMsiKC5eUPke1koZQiK7A4FU/nXty/uMZ5Euswo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xy19ILGb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LGfKmXLD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xy19ILGb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LGfKmXLD"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UMrENH2009513
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 23:54:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XgFBMuS+PB0NzgKzGKdztjxhr9r6FfGOR7K8XJ478Io=; b=Xy19ILGbmq5vULms
	UWzcO9c5tmnbvYCdFRb0cZ7zDz2Y5XPO/RAbIZzD1PkL98jilXxayFQdtaoR0uwU
	DLF8cvdqYVmnZtVgefrkP5IzdgWiRyMW/5lMFPjYJf/pdV/s/6aUg8AYQ4skpanv
	OC1dNCJ+H2RYN+J/FnwiJ3p4QKEEOljMy9H7ykx/Lwe1gr70uH2CNNKnvN4dfajj
	Y1jdgbkkFdR/y7AWOvjYqwD6a24MTjKxtU3OgpDLK9svQ3+L0uJ0x0RlvhMvnRlf
	dwcTJBngZJ8q+5eSTe/kQxi+jyvJEq/W+JMB19L20PH4DHwG10+KqXMNKc3FzGVo
	8Pksig==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frfmh063b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 23:54:16 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1a97644aso3710491cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 16:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785455656; x=1786060456; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XgFBMuS+PB0NzgKzGKdztjxhr9r6FfGOR7K8XJ478Io=;
        b=LGfKmXLD8xYdJNtphJXUoyAM4R6YNouRKYygpjeDk8TdjPSHAGT9o5i9bAmkqW8/kv
         Kz+qFKQz4XVVthI6x1ytpL0jULbAavjdEiZy0ub2Z9cEqZ9aCZlxIcA6Jd5HQRRk09dR
         kpvUdyu6HtwIZkJVyJDZw95ScRTovEKQdfZ+O/c3Rb9CiQrEaGJbtxScFlP1TzpQxdc+
         QGUUS/KwCye+AAdemn6Ghb+a4941adOjVUsfPt4P2itOUizIaOjN+88B2wROhS/WMPMk
         aZo9CYo9nNUYxAYpBphBL+sdE+FMTjEc2EfT3o+orhssnpahKT0U9dJ6+gbEnDlFS35I
         IiHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785455656; x=1786060456;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XgFBMuS+PB0NzgKzGKdztjxhr9r6FfGOR7K8XJ478Io=;
        b=oCB8uLaDdpnMJSeB+8zoLtyrNd5dbqyitbA4X2WCqGIV2yW/HuJAZRE5G4aenVfgel
         qg5yW3PMHQjCCYbO45z9SFppxk95+5BEIp3Z7NtWMBuBysdRjYbEvXySpOckG8gD3B+d
         CxYx69i2ljppYIQB+0unLro9zEJ3DhpfiURt98l4q6nOcCs1Xn0qj5aW9EcXg75VNosY
         aJ+3cO4fsuu57HxAjw4qBSGjbYU+Aq4R9CJL1VRNUM4FMswUFEiXYQV9iPmqCwV1xxj0
         /XcX4cG5ZwOu6LBFf7M6vXb2cu9hU/LDnU8+0erMoeslLEPQHoPcezLe+qN5v2vlC91e
         Pt3Q==
X-Forwarded-Encrypted: i=1; AHgh+Rr1TdcdryRYHC51hQ9AZDqolIKE3lfdRbain7SI+7TweOjdulPDQBbBFgN/Xtwba5NDLL0Xgq4J94Z7A/za@vger.kernel.org
X-Gm-Message-State: AOJu0YzVkZ4pJDse78EVdVVSZ+BZFWj43qRdsEpXYuOQM2ozq/I84ajR
	mWdk7BxAV/pDvQte/K207UyBhj+aGsD6tfXleNfzrvRfQ1eDrHz4qjarNiKv4UCkTX3jeBKyZsn
	i68kZaeye13DTfunOh67Y4OZmOI7i6UaRK2RwAR0r7641CI2dFn1Rr4PiUEdJc/RxuPj5
X-Gm-Gg: AR+sD108rTqUHwk/1bFpUNCfSUmks/elk5+9lMMUWDg6b61LS/OFtjqsD2kiVMr66TO
	j/n75sC3trSSNN/USHkM7EdvvEaqXkKK/kpsXvBbofISZLCOVYJs1yDyaau+R2N9QujTR0SGuV1
	DOa2T6j5HoZWd/gJy7+7FGsh/tiAdziOBap3pg3MTVqBu0hODLSybcWZ0jAyR4rJADnN9ISY7+g
	Wdi9aoUaS7PoqaEq6E0c36ACmQHacZCrexZ81noBk1viktt0EyBj2hggy6HYmIsUdDcWdriyEa4
	4z6rSMJ1xZP6h77/1PgxY1it0VGR8Unpxu1S+2nQWrSdo+F8mz06c9ql18G/+3cZoC6pZHoqTFy
	XvLazkToMT0xPt2GEnn7RIZxrNrH5hiGGxSE44nLPX3/9u9MXGgWJL+gnpLTZcqjPW1gE4rTqRw
	9n18n165ncvvRKMg==
X-Received: by 2002:a05:622a:15ce:b0:51a:f94e:ce51 with SMTP id d75a77b69052e-52b3867151emr49785351cf.50.1785455656033;
        Thu, 30 Jul 2026 16:54:16 -0700 (PDT)
X-Received: by 2002:a05:622a:15ce:b0:51a:f94e:ce51 with SMTP id d75a77b69052e-52b3867151emr49785091cf.50.1785455655609;
        Thu, 30 Jul 2026 16:54:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2db9ba855sm638689e87.49.2026.07.30.16.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 16:54:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v9 19/19] media: iris: constify inst_fw_cap_sm8250_dec
Date: Fri, 31 Jul 2026 02:54:03 +0300
Message-ID: <20260731-iris-ar50lt-v9-19-d71a782001c0@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260731-iris-ar50lt-v9-0-d71a782001c0@oss.qualcomm.com>
References: <20260731-iris-ar50lt-v9-0-d71a782001c0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=964; i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id; bh=7KJFUkK3IqBdyfiDVBbWS5wZfeNsRT8SMeMXT0iYUtM=; b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqa+MuBlOl9n82gSaw7A5rRdOg6s6vZ0ThhgoXn cqdC/I4hNGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCamvjLgAKCRCLPIo+Aiko 1ZoDB/9shlctZEAYdOX7hh+LN1GFLylH8KEUBi5W88HbJCx91E/hyD3qZ0cn3RKpwC1SY2mXwZ3 Q/bFxzhMnQSUhcvGiX/0mJLago8Otc5iSd+p/Who4GxI2xLO9MJlr4mXtHk18hU2C626XvTMjx5 eu75KSeJZ+N/dPELa2oCC4nkh797nyEUWtwiiXWVfHWw2hUcRLkMOIWU+BGdumMK7Kaoac/+Ok+ qvu5O8FW+HVL1ZWmyZ1PGAt3LLoe2eGq1JVr39aEkohs5loALT0WHq87OPqYwj7Azq6KktBJTzN ED5Cz905F34YLSevy95JOQAySfi44oKDx1yExF/oDP59LoBv
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp; fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDE2OCBTYWx0ZWRfXyIBp+2ocv/YQ
 suwQtRO/rVEWxUHUihs8RGRLA6Tnhe43A3K/n/qjUvkVkjP8X4bwdrBA+leUarYVEtP7HGToKvx
 x+SUYM7PDHpfGHu+tU1Sq6Md4Pts4NA=
X-Authority-Analysis: v=2.4 cv=evjvCIpX c=1 sm=1 tr=0 ts=6a6be428 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=aSZcYj2XgHFsS6ESuJkA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: WaQKtgA2EReSFr0MrBk_C7M7G68aoSJY
X-Proofpoint-ORIG-GUID: WaQKtgA2EReSFr0MrBk_C7M7G68aoSJY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDE2OCBTYWx0ZWRfXzoYI7s0Abu1+
 933JEy7t3011dwDSCxVX9P4K17ZQ4d7UhNcRtKYHL/6nIU2cu1wqfBxIvtVNz4SVL6VjNZIFWJP
 4/gjgjaiWJ1pBNpMK1tdPXkmbgh61LJPsX4CxuX+rOStvH3XHy6BQ/HBYDB+WMVuAL59gZBmnDC
 4S/dQa1/6aSkzSD3jFr7ka3MJufksuzzEIMUH/xoHcvru2iRWu333jAat+5Mm4JkmXqWoDTw0a6
 cQecCxEo6EB0hHivslL/CD+Frl2ET/zzfFYVqcXFcuURw0hQ35cI/ealkrK2D235lca+OVlLYHB
 rXhdP/sFmRl4IV431BPHzbL4r5kR51HQbyw1xq1u7ecqugvcgn3XGVUDw6tQDTt4cmg14SvrEIT
 WrqHOIUbfftRC4IHutgwaNNvlan2cuJ/qJheAUx0+cnSMz3Pd0EbOm7/+bGd1cTpot+7fPhYL0b
 6kZ99ORiL1AxkSHphuQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1015 adultscore=0
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300168

Mark inst_fw_cap_sm8250_dec as a const array, the data is read-only.

Suggested-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
index 548609315b85..1f87cef986ef 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
@@ -13,7 +13,7 @@
 #define BITRATE_MAX		160000000
 #define BITRATE_STEP		100
 
-static struct platform_inst_fw_cap inst_fw_cap_sm8250_dec[] = {
+static const struct platform_inst_fw_cap inst_fw_cap_sm8250_dec[] = {
 	{
 		.cap_id = PIPE,
 		/* .max, .min and .value are set via platform data */

-- 
2.47.3

