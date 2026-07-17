Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E824B42A7AE
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 14:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784299580; cv=none; b=NqmZbFw90qTCQ9yI1ijT2Pta3PCdmmEaYyAyY9DJlTbyVK/vr4uYdJ+tonsMsj3/IYRQmzeH12AHMovQKosPHZ8dvS2hVr5IG/LlCs9FluR+difVA24czrn6Y7PcbOaj1ipXT6WEd5zatVLAWV6Z1K2+sDDnWMEf06CXtd7/WZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784299580; c=relaxed/simple;
	bh=jOGIwyba4ZD4BXF547fgfmWYOt4Y+WSzqc9AXu9rVoo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=G8KBnuBajyFjpldvPMsw+LjNbFi1GU3pMtRmun5UB2pqKv7EqO86DRY4PkQvMrzcwJMtzq/3XlDxVD4u+uqCnu5l9Qzk2p5CLtehX7F7dd3wsSjK30/XdwysBWqc4M1Em0p5j/yzjKAes2aL8rxoUxdki4L7NuQ9l1LHgIVpChw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FXUQOOHj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ysi/WrNZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FXUQOOHj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ysi/WrNZ"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HE7rjK2043954
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 14:46:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2YBmgYqqiWvkxoGNGtW+gM
	+8EwicKHDMEQq55ODtwzk=; b=FXUQOOHjq/PnecFHk+Zv2FZf37IBT1HTLmr97d
	okn289KMuITPbIdvBVxZ7R7LhqeEhEQIHZO4//29WVmxBkQv3HaoOfgW302gBK5h
	Ed5F4/W3ObgyugXXB5BvnSk2nPjyhHTEm25dDs6lCm07YrEEeEkjk6r6mvZgkLll
	Pzeu07iOCzbduurtrN2BCDg/+IZn0jQMoMfdzwlJrR/2OeaVQPqaUZRwLB01hymv
	d/bxhfAUmjx08FpzYyLZN3b6C7iTP0jgQsZyy0rFu18Jysccb+4hjXHwqks6t4ip
	1hKUZaSYrW5I90SZaaK48F2IFY4BctjbYGzCfosLDBFBE8mA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fff811u0m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 14:46:17 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5174a236220so142930491cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 07:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784299577; x=1784904377; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2YBmgYqqiWvkxoGNGtW+gM+8EwicKHDMEQq55ODtwzk=;
        b=Ysi/WrNZex/wRJK2mxAQfTAOh/Hdv6oXOeugnotS9nsLMRgh6Zalngt1dvGJAqja0n
         6WvlUlsyYRDme4puWeNbQLQZEpY4UzTWrFovLBq5n1Lft0ohr6RgB3I/K0aRDlIsQJi7
         nt+mS+DWqKztu850xWAlA1O+2JE0UVRL3haAtWTe+4uk3l+1Un5hiJ1ZenlXVrUtJuXM
         ZZYraENDpnh2as3rSTLcV7Bh/Yhr3JvC90aDrz+VIWqnPikf+fjePjP/qIccdKkuQlo4
         YzJaBz6Qy0UfZK325Wt18HAEpoEdgnLNYU3vCp+sqSJuLzu8uR3VVtZL85ogPqnUAeQG
         jRpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784299577; x=1784904377;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2YBmgYqqiWvkxoGNGtW+gM+8EwicKHDMEQq55ODtwzk=;
        b=J4dJ6y2PHJldBMx5aw+Plo1by3oLINq217oPMYPeeZcUMlMmQI93pVJ6OXU6gxBvk8
         6pq50NeC/NUrRkl1OannfFehP29Eb1eeZD1/eYFdAKw1vWmXP07lGHLLBMBKrFONuXpL
         bajRHAtdN+QWnKm8a09JLjaP7Pj/fdwwR4adLI7wIXziYWZ+YkQQBClqdOlghzUk5LF0
         aeWjTKjX9jGfbkt2njSxDbAuGAvx4S0qkLxCZ6izWOilnVwomx6AVky01w42KhHLB2Sq
         8cJg9QBPQuohTnHIul+68ABN1LsteSwsBmrFjkWeIpLcaCMVXFIiPy4SmKCLmB+yLGGR
         8QSQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrr8eXKxGc50gDQXFulVxbwHC3tPJR5/ivxXzCgkM0HP6gizfdCh5WkTPno1EAdbqbVEtGBBVdzznALhmJv@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb7bmFc2zuB9D5it9exAArzC59idnNcnOIYBHnCY/NinCelFuK
	50XAiY9gumvvaUncs9xEPAjL62oXZX3+6piGnSdUd1Io/y+DJHZbOCsDnmb8DreOXi9WgNg4Tj4
	RRJkKldWdiPySntI+jo6he7bS+kq35crKXTi4T24bl5F9Os6NcUrdQrUKIYkmBAueF2Ma
X-Gm-Gg: AfdE7ckkBrgnWj7pwr7rY5jDgbS2WJ64QYkjkLGsPWBhHNV+5yWjU3pAUqqdTG08Byx
	+Xl/XsReDFX8zkJWTkzybwMtxsdA87PSAJz3tLT3wUL14+KyjGmbczRiCmd3Ir8kQ6jsVMTOLNW
	PEQk//DIKUWQxeqNpDrPSxzwKX3ZpkQQWHbUxiR/3vxIhD6QCXXcIGqNERI2Zk0whNBClLbsWRa
	5evkvTwiyqT0Zj/FrcI6REMFOdofWGYOgiazXfRSLOxEtCc/OkWwRMfA9q/zI6zNJiisc3f+5jk
	jxFOanFm/bdP+814Npox5X3qVxP7KJrTB9ssHKr7g88ZTR60cveXwMzwBGkynjmaiw+3wPm/s1t
	6Bm8vTKhvvTEhtP8avGp75lQAgXM=
X-Received: by 2002:ac8:7f8f:0:b0:517:8011:3a4b with SMTP id d75a77b69052e-5213c7e50cdmr24070151cf.21.1784299576643;
        Fri, 17 Jul 2026 07:46:16 -0700 (PDT)
X-Received: by 2002:ac8:7f8f:0:b0:517:8011:3a4b with SMTP id d75a77b69052e-5213c7e50cdmr24069531cf.21.1784299575917;
        Fri, 17 Jul 2026 07:46:15 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52149a3ce4fsm13414801cf.0.2026.07.17.07.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 07:46:15 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Alex Williamson <alex@shazbot.org>
Cc: Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 0/6] iommu/qcom: Misc Fixes
Date: Fri, 17 Jul 2026 20:16:02 +0530
Message-ID: <20260717144608.3216274-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RbqgzVtv c=1 sm=1 tr=0 ts=6a5a4039 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=Byx-y9mGAAAA:8 a=EUspDBNiAAAA:8 a=AmUTqjPzaPleRPW9gFYA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 2Ixi8IyR-uizYOlvoy3zigqrDar8bq1n
X-Proofpoint-ORIG-GUID: 2Ixi8IyR-uizYOlvoy3zigqrDar8bq1n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDE1MCBTYWx0ZWRfX1pj/WWmYMtwB
 WUIgBCpzmdqq28+K/WjMRoheFCLo41qR8Yd8alr6hiYrlScuvfG6ABpSos0pIaZcRLRgWt36mKa
 MQYfzVUwfwTWPBfjJXqww5b4ar3MjwR6EEenqkcZUB6XOzbfqUfFtGhtuTvQM+xk3uKuZ9n9ZNQ
 aKqkC7ite60jem9SLSO2ZxEz3ODfJY5/nYeS57+d26kcPhFq7z0xaBquYoqPItn/K8SDi8Jk/Ds
 ziQdqUMQvvfjLYQ72sc6lcTARzKeDmXkh6+gPxZMyWjpnlrAd1J01YmiQw7lzjxWUszuELwhoaL
 TH+PxnO/Ddj44qq7RG60Y9V092/+fjSxtJAvStxDeq1SngvNngcwRv/2T2IlSgx/9IMdQVQrQGL
 gTp9FrrTxK9mYpHb6s2wLBK8U71GsjmW14CMk33a90/ph2Uopz6OjMGVbfQ3hyvAwVEHDBeby32
 0fOzDZWICOSfejfRRDg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDE1MCBTYWx0ZWRfXyxBwhWuvhmTk
 p/9r8vHPd69/QivLVwAnV4DJh8Cx0SxrtdzE660w0IPOtBHOcWgNYOqh9cmPWQMP+GC2GsxtRZv
 Zw/vMMt2ysd5rn5+M+f0mEseem9s88g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_04,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170150

Series to address fixes in legacy qcom_iommu driver, it is based on top
of  https://lore.kernel.org/lkml/20260623071245.1985938-1-haoxiang_li2024@163.com/

Changes in v1: https://lore.kernel.org/lkml/20260623122034.1166295-1-mukesh.ojha@oss.qualcomm.com/
 - Used devm_pm_runtime_enable in 2/6 as per comment.
 - Dropped 6/8 and 8/8 from the last series.
 - Added R-b  and fixes tag.

Mukesh Ojha (6):
  iommu/qcom: Fix inverted fault report check in qcom_iommu_fault()
  iommu/qcom: Use devm_pm_runtime_enable() in qcom_iommu_device_probe()
  iommu/qcom: Check pm_runtime_resume_and_get() return in probe
  iommu/qcom: Fix pgtbl_ops leak in qcom_iommu_init_domain() error path
  iommu/qcom: Publish pgtbl_ops before releasing init_mutex
  iommu/qcom: Enable clocks before hardware access in
    qcom_iommu_ctx_probe()

 drivers/iommu/arm/arm-smmu/qcom_iommu.c | 31 ++++++++++++++++---------
 1 file changed, 20 insertions(+), 11 deletions(-)

-- 
2.53.0

