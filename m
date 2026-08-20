Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A703B411A18
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 10:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787220566; cv=none; b=S04flR3Qc/fqOOfmxxY9c2RJeVbXBbCwirwmP7hLSTiY4gpnTeIdW/mRDxJhLGAQTyYmUKj8DIuahG7GgaQYYcoj56FAvIz/NloYeAthJqIOU3fycPb2RaL5NtDfaz5AGvrZ21yB0z7g26Yf5GStr1B2ldkuo2M3p/d1GUBxx98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787220566; c=relaxed/simple;
	bh=cilCKvA/3a3Wka/jsS2LeOJBUE47gxvNpliu0TuaaCk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z1ZIo3J5BBGATf3nevrk8+LeaDMwewdFOU1CpLjdmjEmxrwtV0SzBxSqafOZiaPAdYdihEhVmx1wcHQboZBR9UejJ3mhqSCCcpyvzyEUSxlI7KwUdsonVgqNjRjfLvRI5wYNfFodLoodgiHDZPh6giMVpANLdAbHQ7dEd2OtkgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nNaPC5UB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bHwBUYJa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nNaPC5UB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bHwBUYJa"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K5sdVK490446
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 10:09:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uwq/wB9raf9qhdFurJx/mRWvzmt5xzsSbEkUxJZbwJY=; b=nNaPC5UBr8voAZgD
	mAjcMTG4cOaoinXwLJcuqP19Q+3+JmTjDqvxiK8zUcT72GwWWLIAdJOphQRQEeVg
	/yyF3KDzcdVIdWOUkj4DXUUKPH+GKo67VhS/2Qqf4ONcdhoSh9fCoyn2skhYkUA7
	rg5DV04COIMqxn025B/gUGQNVVSTZPtrooW+fgsbPu40JBJh8zY3UtQ0N3LdFNj1
	2iIFWoA1gcLqxUkkp/liQt0lhbLW0B33rhJdwARgaBcv/90g6ZcPd4LAyqHIJzg3
	/6H5EYFr0Ki+3E1se6hKG2kA6jHluJZ3Ntwa15DjN4fwYXilZEfwnx4O6kxn1MCG
	UvBv4w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5ervmd21-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 10:09:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-933023a5980so330527285a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 03:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787220552; x=1787825352; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uwq/wB9raf9qhdFurJx/mRWvzmt5xzsSbEkUxJZbwJY=;
        b=bHwBUYJaGyy8Q+Q6Uy7hWXyVP/xXFKcXYfhRRhf5h10kkDdjvglZB7Wh1zKwjXaxjX
         GnNX0KZ7cEBZl2NAOi9fQqzWo4DoQQw07NSPkKO98VD3WHWC/o3kLxCCFmSXy/2lYLaJ
         hOa5G5MdcOPJXMT/+BCwzQ4HpYdgz0wD52/wnWFbWhuwQyczmM+Si9uqZyn2MkhmOV1b
         rnfdKwOz8AITEj9aZRlb3qGDPhvNJXItoQHap+sIAUroVBY2XcHf3lpTEIGNIGKnWMJm
         3SlLIzUtXiYyJ0HNcf7xGzEIEMQaRY2Y34IuQ1nhLnX5+w0A89KjI6yxpzbH0tN6icRD
         Nlng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787220552; x=1787825352;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uwq/wB9raf9qhdFurJx/mRWvzmt5xzsSbEkUxJZbwJY=;
        b=FsNB8++G9X2hUG7IGzjABgsyXH53kGDRCz0Ii5ctUQ6D2M6JDERZvt6OF9sw6a3jEy
         VENG6MMAAADjcWmqhA0ScqeoXZAKQW7LwmcE0IlehY8L8nMBpvgdnCtAqFZ4r/MDnrYP
         ehmClYHUhcq6uRd+4HlRaaP7s0uzGtbNHYmL4SGqJdFzCq7pGwwgCWHlgnSvZ1yuEg2S
         zroP7qPusU1HZM5wkfmzn/ZYiWj/ps8OrrR++2pbaESqvYiNwWCcL1otSIkun+aQXnNd
         eyYCwYJzmG4QIiYaxDaVpc/U6eXG/NAeS8zgYinppe80VjXACglSpDq8WAWT5qA9yQ7h
         O/NQ==
X-Gm-Message-State: AOJu0YzDwH0KVa917Nxgh5zViBk6WRUdC0Ux2Yzej+094zI1YNb36QBq
	AtKRGAk8un9fY4VYI09V5FERK0RuVECulWKAbQklua2AjinCbtB7dpj3s+EodBxL2b7Erp8O/d9
	jDPbJ5yWc8HAI54KiJ8QFM4FQaP96rqPmbC/7SeusP+xR9NTfotd5CCuR8l2TB+A9LSww
X-Gm-Gg: AR+sD10waRLuoSRfxXjOyOP8EAguvPhYwEY+PUfR+aBozytJvpiW9YfZQeLFIl09ZCO
	+3G9MuC09h2jObar1K/iZ1b+ZNcHEf6zdAY6AxFOB2SRXdfyd6jQd/HZERXHniO8cUB1yFToazn
	XPlgOmUjM3bDv4AsfjQBr5fH5OaLZ3IfGdHnxJDChcYj+KoOLipCHqWvqFImdJU9Kmovj5RA2EL
	HIH5BE1G203MXapRgXTL6d9x26pJXXoAlgmsyU1t9loMugNC7wOvrJS12YnklLL0A5QqVaBXNNB
	v18C409nkQNUC6M/HksB3GCQLpY0Rb9puKreuUr6NyrKJ64P+om0glCKjlSOuPwfXhFMzDICZT5
	BPrLtydkd
X-Received: by 2002:a05:620a:8903:b0:937:519:4e7d with SMTP id af79cd13be357-9371e30e640mr1187688485a.35.1787220551946;
        Thu, 20 Aug 2026 03:09:11 -0700 (PDT)
X-Received: by 2002:a05:620a:8903:b0:937:519:4e7d with SMTP id af79cd13be357-9371e30e640mr1187682685a.35.1787220551399;
        Thu, 20 Aug 2026 03:09:11 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa1755b2sm134966935e9.11.2026.08.20.03.09.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 03:09:09 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 13:07:15 +0300
Subject: [PATCH v2 12/16] arm64: dts: qcom: sm8550: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-qcom-tie-cx-to-gcc-v2-12-e67ea30d8b7b@oss.qualcomm.com>
References: <20260820-qcom-tie-cx-to-gcc-v2-0-e67ea30d8b7b@oss.qualcomm.com>
In-Reply-To: <20260820-qcom-tie-cx-to-gcc-v2-0-e67ea30d8b7b@oss.qualcomm.com>
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
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1001;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=cilCKvA/3a3Wka/jsS2LeOJBUE47gxvNpliu0TuaaCk=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqhtILzH8nsc8THegMr4fxmgF2tHWmyP0XX0/Ci
 M8O07WN30GJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaobSCwAKCRAbX0TJAJUV
 VkYkD/wLmO3OeadGLWNvKXA2M53dqFJDz/czS9FiJ/rHfoChENIuxSpNTO8n7DrD0q6ONhlPTrj
 lWIHdM/MV2X1IMVHpujxd52gSTY47hwwqdETi5yCBioL0XUFFk4Gq82VIkEA8NGqiEVTnLIQ/+K
 q+8HUP3GjVNaMRZ1LkNidGETYBxIiak1n1BNWRSbWueRJ1TZdlS9oSizShM28GeZcjbbGCbxiy6
 mTAlSv7E7Ug/dB3n57y/jNCQYKvmF3Pei2ahJ84w8+scuOlvHcDIGH0eBSdIOilnJhW3ybv/8sX
 NF/r/NxBE35VK92f9JRFiyZ4Fprf2SGNQf22cTDouWNXogUjsJ0Fp1USMN+QBDBpFfXrw75EcnD
 ij1/3hMS0v2Wu/HOxbI2suesnCfJ0uQoqHxzWeuN5tWYk3R2x8Ry3YSZdFAF5zC/p6z/nKvVrPC
 vKeinetAAJ7gnCgR/0aM+d+RMc63VvdTLUT6Ghe4u5sdZd7wERBsuqftUDHiViy9oHNnjjvDq/i
 2nTWDq+w5+n3VrVkxaYDbc33PvC+CpJtjmDrLR7/qqgmro9COMLXsbhdchaw1i5DUThZutYxQME
 hVgQOeNx51LdX0a4CVm9NB285B3GlnW8yXFGRZ/7RBdjAWXUj+cAQqySaVd+vgqULicFBJq/gaF
 bTbc96qj8rEhs8A==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: 81pULhaF5nVfQNLwybuUc6FTfb92mbbd
X-Authority-Analysis: v=2.4 cv=VZ3H+lp9 c=1 sm=1 tr=0 ts=6a86d248 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=S9gNOWPKAuR5AUhlrlYA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA3NCBTYWx0ZWRfXxTWZ8XGbNIA3
 diZTtZnnHOXMnjaPUSwtAYmwFYcBzrrqYFI5hAUGxz5wlNzGqSnrrDsYp/F5Y+S6o3/BOC8VDM5
 FCS3tb5fS3All/lq27zc01ynf8MaAJF8SkWFTcjTorJ1/x/MyXhg/v1fRRKOnY+CU3Zq/Btwv7T
 4LOjx7EsNkqLwFgO1JVhz3U09qZHdfpWFaWAc1bQXBQrghK/IiMx+oZqdU9Pln5/onkhRqiF/ok
 7A7QIkRRsN9syVK5RzmOvDKyoLkME23CUumvK3B6VQCX5cLmC7lYKbFkJz/+1BkBQcx7l0mGuoZ
 Q7r5gWjOGYLLxFiU0rOfwMQuEGK8V4Z5QTShj2VaPET62DQQu868Os7378Gvz6BSiLWNF4S0p/t
 V5Gjm8A+4UGyw5rQ5ZdmifICu8f48sMPmS7tzJNKewXEEgMl4SJ6OrGwzdrZWhj3+YC3+K2vJRG
 p+ihr1vt51gAf0+d8yQ==
X-Proofpoint-ORIG-GUID: 81pULhaF5nVfQNLwybuUc6FTfb92mbbd
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA3NCBTYWx0ZWRfX5gfLQRdtaPKM
 ziNo+uNXYL3leZVUf74DwbF+pxSNTwRiR0hvCL/Ob1QNwk7ngVYa5TRdQZfz3IhS9PmXrMLB1ao
 tFEuGuPRT4gv2eDZhbPl72WTxryUeVc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608200074

The GCC GDSCs on SM8550 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 0e701e709235..7137efb45346 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -1195,6 +1195,7 @@ gcc: clock-controller@100000 {
 				 <&ufs_mem_phy 1>,
 				 <&ufs_mem_phy 2>,
 				 <&usb_dp_qmpphy QMP_USB43DP_USB3_PIPE_CLK>;
+			power-domains = <&rpmhpd RPMHPD_CX>;
 		};
 
 		ipcc: mailbox@408000 {

-- 
2.54.0

