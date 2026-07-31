Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D793236B900
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 06:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785478499; cv=none; b=tylM02IHhICFWqmvjsGgSHeIe5IAWroyzm4//Umsbdlz1lVHDwj3qK0vpBxMZ8KT2cMHSfCoBJW4tUd6EDDysYLbS6fvdM2eVkymXbGg3NOBcu6LY2zlDekXGZDVtXhwGjQXEfdzmGF2sYX3UEcWOAUqJn13ZuCaqNg9hZXmGy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785478499; c=relaxed/simple;
	bh=jkWeTjrNI+xze3hIGsedzEI8x6ITSkIXkZnnxBafFoc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GpAj2I1GAoAJ5Q3nXXrfxIZwCNfhkE6W4c9IgB3IEBcW/UvH94egIs6XO7MmHIw/vs455cXgphntUx3grm+9oEIGj/9grtjnYricTlNhnXHEt/tPr4GlwITCaN3oBF9PVBEzE0Ryl+MbHLNySWs4lLu/umuANG63lyrBMnpUQDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FpxQj5Ih; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sz0J0OrF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FpxQj5Ih";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sz0J0OrF"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V60GVu3131093
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 06:14:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Uf2pAx6sV2vt+5z+Vbi+GKfH69mjyonF0TZZ0rYCIc8=; b=FpxQj5IhIhmj6Nx/
	1EnEmoVzPNI1TilGMIxhDg4/TezVQFQovSr5OW7ax19W3m/W3Ml+49i2kN01oLno
	aasVgw8hMjCzZXBmAaMFAPqzgFswB8BJxgcXwxkcEGpnA2Aax0a0JYIdQTCErm20
	kUPdJXjYMNl1UKrm8O1/eG3tP5JSXfGAOHi40q6sKGHGtfTnrCU56W3ty1Zn0i/G
	bNmR+EeDB4st+OkC68QYCDhL6cS/gd96cQ2Nk8E2XEFS2aHKjDEARWCGip2GjoBg
	KKNm0zvE+cWWFo4zkJPr5mNxvOEWQGV7tfgjwa+RM5T+MPLR5xpwazdUiZaAkUQu
	v3UneA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frp2ar1rw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 06:14:56 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cec4226c70so12348185ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 23:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785478496; x=1786083296; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uf2pAx6sV2vt+5z+Vbi+GKfH69mjyonF0TZZ0rYCIc8=;
        b=Sz0J0OrFYES2wijH2ZiGeBxnm4OAlabkfPiADxLz6+5+MYb5ZbARBRSoCzcVu9IW0r
         IkyMO26OA8oTXG+DnDFyvUYpgF2fJgwW5qhGyKCrHnaaesUuum40SJMyAhyumtL0+1v1
         Io+G9+ZC6DIcVeBnzrFY8lW8we3p3yXHiiAR0zoMgHQPAiqWy0LFVdKycHx37Y65KNWm
         1u3Dw9JOQbmQKdK42jMgCLt1QVBT3tqX0Zl4jWTic6QgzSDSALOGQ2GVG4A8rrdctQlv
         b48DrYPwAfAvX8r1969gxAp17Y/rvzR2yP70fVSklpp2mW6aojQYNtZevaDCUL2FlIMH
         VEsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785478496; x=1786083296;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uf2pAx6sV2vt+5z+Vbi+GKfH69mjyonF0TZZ0rYCIc8=;
        b=JpJZAV7jWI4u7TP2SmBMbFydhiW3w/EJ2vTPR1TWyEfrg1O/7ccpJcORR1cerRYte8
         UTDaCLUCnPK4TCN+wWXcwx3vkR93Lw2Nfx7/AD/lNoQxCXbFh6chv190iZEMNw56NTrL
         /q6twvYQPp4fOOgU26zFMYrnVGAcbfmNUPP4HSoT1R5j/C8xIiSiRK5thWbsBBzUKPqu
         YcYKe18e7J3QPO/+N/nu77ExiVQwoLBlWMPaWZ5ruoZBIMdBsMxP0n3E60x5txBk4jIK
         MlHCom93l8jwWIpZkJEtqoagsHeQW5lu5HiANvN9Y/67TrvM4ZyziLJeIjd59pmwU9tw
         Kzgg==
X-Forwarded-Encrypted: i=1; AHgh+RrR6c/ujHz1Pi53lDFnjB3fEcmmXVM47fu0uPjvKNgHJ8/kDoaKA3DM1Bpa1wHEY6HymYfHOUnPn85HEnds@vger.kernel.org
X-Gm-Message-State: AOJu0YxVbCY342ZqChdojA45880H9MvwM82baYudRV5SDcz2mLJoMSzh
	5bfA5U8fnX1RuvBN/Zgj/S9BpvdDWrGYvihU4FEvRnAXPhEI/2LRTPEnJu8+3WAlCVSmwiNSN5Z
	jIDVhg3Q6tDZtuWYbagQE+9X8sj2lpc3BlbDhQrq+C7Hn3CBwr0Fw3KRhfoCUZnU4rUZ4
X-Gm-Gg: AR+sD129MSRSuzX/A5NRUIbx5usWkUs1xqLpF1Y/Xk5+U7iOhSSaEekllwsINmNkDC2
	e1hmbSLL5UrJQaqjHfpbMs02v/ZH8/YYfgie0QCrleuxF2Hw/1J6PyvbuK9wFjSPzrvG21sWW6s
	mqiS7Y3DncgGC+kAPskGeD4fiAeow4oWX6Liar3U8Wpx5DPgiD1gWaYcDuOIztvRmDyPThIlKSy
	2fSq1ljawSjz1SkDaWyC/7ShYLIWFE/ivQrPVAPw11Is9sZfAmVkTBCBbriQkQx2fydR50/hZZc
	XFHsQdI/qFoBR7YfKcXYeC2pSRnxsh+vGiARcC+DsnabX7KcwUeF1d1SJxgF7O/n0vJo9LLVg7S
	OAUzBU3u0COwilZAEcoVl7qnfhj1oxRYdxLhCJDkFFfJcwjkjMBb511fXsV1J8o8Y
X-Received: by 2002:a17:903:19cb:b0:2cf:dcd4:c646 with SMTP id d9443c01a7336-2d046e8817cmr8420785ad.33.1785478495567;
        Thu, 30 Jul 2026 23:14:55 -0700 (PDT)
X-Received: by 2002:a17:903:19cb:b0:2cf:dcd4:c646 with SMTP id d9443c01a7336-2d046e8817cmr8420605ad.33.1785478495116;
        Thu, 30 Jul 2026 23:14:55 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04b15d26esm719635ad.76.2026.07.30.23.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 23:14:54 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 23:14:40 -0700
Subject: [PATCH v4 4/5] firmware: qcom: scm: Allow QSEECOM on Kalambo CRD
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-b4-kalambo-crd-v4-4-e458f8b08114@oss.qualcomm.com>
References: <20260730-b4-kalambo-crd-v4-0-e458f8b08114@oss.qualcomm.com>
In-Reply-To: <20260730-b4-kalambo-crd-v4-0-e458f8b08114@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785478489; l=984;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=jkWeTjrNI+xze3hIGsedzEI8x6ITSkIXkZnnxBafFoc=;
 b=9FkTobWKSq3OTUgsN8Rw8LGKU4eULjMRN36hqMDr6rhVEyM1jYx8jEP4ZdopWea68YbW39ia/
 QD9rc4j/0smDh/zukabBcFD+B51HmsiVuyjkpwacpsSXdpL8mxdHYPb
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA0MSBTYWx0ZWRfXxP/KfNaW9bXA
 kuUiqPxlMyqN9Z7Xps5qMO5MnlZgZ9Xoa3AVYwt7Eznfcw5bVfcT9pz4/tyHs20eCX4EyYpG+LQ
 nNlrDoNfjiRRvLTZ63EnKKk+8ImMHvDB0yptzCqpSpYRc1032kjH+zQ+pBqtMJd8WIB1jvTX+Gh
 wUMRqfs/2helLZj+NqCQJ7Tx9Nj3Aco6F3hKZow6+gjg4diY0l9uHSEYEPAvoJ3I8Ka3PLl17nj
 IL66Ih2JZ3YNyPwXMkb4bm+fMXYLZX70Mbx6VWTFWuwBDvuZgZQ9ueinuYc8ltj5by5ArrXaMa0
 6m/poadv2vqeq/aDi7AUwFUCXAUngRr4lHRNuMDRkC5Sbl6S216E6eZa1EeBOgQhYbFPaooJO8u
 TdlJWgI2SiQtuYdIvGcF9B6wokf57hcV0JnCFWdKZjUoZBr9jZy92K4UxXdy8Y3S3CHQ/ZWQPCf
 KmsCuGmEw4HsW0CHylw==
X-Authority-Analysis: v=2.4 cv=RYOgzVtv c=1 sm=1 tr=0 ts=6a6c3d60 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=sPeBD9Pss2NjrgU8DtoA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: v5FtmDrvQ6yXtQ1-nX_22Yh58xWv5G6U
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA0MSBTYWx0ZWRfX0O0MTvu/R8lP
 dPtMmENXR1f54JKttU4tv8G6/VANVE4ygiPUgKXqWMrcLLhwYdH76dD91EYG1YldN2rTkI6w3cn
 LJSPTToB9+dvDFPbeXndYG2xNSUvck8=
X-Proofpoint-GUID: v5FtmDrvQ6yXtQ1-nX_22Yh58xWv5G6U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_02,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0 malwarescore=0
 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310041

Add Kalambo CRD board to the QSEECOM allowlist for enabling access to
efivars.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index f35f2ee39130..d1cc6c908daa 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2327,6 +2327,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "microsoft,romulus15", },
 	{ .compatible = "qcom,glymur-crd" },
 	{ .compatible = "qcom,hamoa-iot-evk" },
+	{ .compatible = "qcom,kalambo-crd" },
 	{ .compatible = "qcom,mahua-crd" },
 	{ .compatible = "qcom,purwa-iot-evk" },
 	{ .compatible = "qcom,sc8180x-primus" },

-- 
2.34.1

