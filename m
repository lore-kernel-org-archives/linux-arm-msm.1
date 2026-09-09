Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D2EF4F55A5
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 18:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788979594; cv=none; b=tcLoo5myfIhkspJC+7EK9drNMauHeIEfRqyNu/k5F2nUfudUvr8KGhSs6cWBkqDZVTPt1MpGcpcIs5EcJziS0Ck2kmq3BmDltuqBRED2AShgSKHiDQFuOFhVmrOkZJwIZb8qhXS1Oz/8rZSmmwJtAOw136imC4INQi/9JI51/38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788979594; c=relaxed/simple;
	bh=nHVj6C7ObfXBJe+eF/4Jw1LC2YX6A5nzTMPulUhK9dc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eyW41ZgkyF5vZgEp9278ZxGu1JKnL1w2DWEHmA5miSRTWJhgoP1Go6D0nRgRFjEkNQg5y34mTxq+aqy9UyPF3zImq6e6u0WhEk21x9FGOKVQpVu6Ai5ufBmwUBUMC6W4O83x560VEFA51knezpEoJk9PdhobIcvPiFRDh1hmSOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IZompsQY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ivqRoeUt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IZompsQY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ivqRoeUt"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689IgJSI2147065
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Sep 2026 18:46:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=349eBNq8SzB5dySvqp4+a/Lr
	FlWacg3L3HHPu3sbxTo=; b=IZompsQYvPCrZss0gRV5Dwhbu6U6CXX8p9NOTFFI
	lZkThIm8pinUC/2ObU7kN7Yot8zRAm5jhTpu3dVipun3zIsoUaexzIPjAjnJZjlo
	VhaLILFdz7QxKXD3N2gA/svRldNHSBs6yZYNYldB9gLupv+aWHBxbYKVw4JH5Crn
	JVeI+Ln6TOWcF/SX1+FRmpzg8RnONkihdoz0n/c6bEhfohaH8HbZ890tXENc5p5Q
	eondRcOjST69ZzArM4IbSG3wX/I+WJwQwhEGhBeEdF7STAQldS/KES8I5PicZcPC
	C2mb6irotp7BISZBNaxoqquMI9hlGepOcwl02A8dT+uyyg==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyfg0t4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 18:46:31 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7ec3b429610so9653187a34.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 11:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788979591; x=1789584391; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=349eBNq8SzB5dySvqp4+a/LrFlWacg3L3HHPu3sbxTo=;
        b=ivqRoeUtEbyB0S35+sS0QWXZd/pb2DedG74cuNMNkB05EBl9ykTGoAUEzgSg06IVCx
         PLFWtB/Xjdg8qvF0nOKLe0gnz2YYL215ZfRWA2J0Qe/MMNYf+ehQS9lMt4oM+d8Skgwv
         dwfPerySecL2K8KoxSeAFN7wnbPkGEeaQrZ+OH1+9iXxnmu4AIFThsG1nkd2+lktHxQa
         AdEBrOX/uJ8nYWZVUx2q7/aZNP6FLWPJ3S7zusKuQCNBpAZCfvdJZ10cQvBjirRpPvIl
         5XANOEOErEGVFIYFmavMb5IlVmTETO6WXBSt3h2f3tWDHexKTbFbYQt9C/h3TZmwXWY6
         8LsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788979591; x=1789584391;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=349eBNq8SzB5dySvqp4+a/LrFlWacg3L3HHPu3sbxTo=;
        b=JmZcRmAfOCe0V7JRMM44ph1Z8dz0QhjwzkQE+hB7ToArg3rfjlXkhiIK1KKz7QvFp9
         tvG/J08zbGNPtFIvf+zl15Rgnu/RPKKK0XBHt3Ra11iIZ1lYS/0F/uMRP276KdJliodg
         2GcgZcLJsHOqPk+ngIVOPCXBdy6MZNXfZGWqR1ehaLzCEgIdHxCbXUDqZPZReAyA8Zq0
         P0Ge04atqucKSxiY4fwVzm2aJLLU74/CB+8s8IdFDvFSrdoYuYDsfP8NbgO2ISXqwkbL
         dRYazYIKnaflOghPw+BAVTNvDysMexxtA6RZsFReSgDFyVFtAOJ7LvvV3gVUCGdVlu6Y
         rYVg==
X-Forwarded-Encrypted: i=1; AKwUvBza1TvW4N+5kFzDIIXfOjkZqKwntgfo8/GBQkLZ2Fp5AVk2tf2SZ9aoon4nReBsg1i/KT3AWoTJeGlFz1TH@vger.kernel.org
X-Gm-Message-State: AFuF++keXGg8If0BilJjZyHF0g7kM2nBcxibiI7bPviy9tDWsBgH1c67
	J2bCb/wu6hgYjuzLv29olpz8KcKKJ+1j8VblgIT1wYqhXXchqyb+hhRXSVHYEOqTfWmt7eLDofM
	YiFy7Rcz0sAboemJPftWW2SExKBi7N3AbfSrpvQG44Yozcex7LutKmmuGswof47LLlUQh
X-Gm-Gg: AYBFou2qTTQ5Dr6J8D9KNv/08c3jxetaNRu8pQW+61j4V91bUJcIJw4N8S0ReI1G8g+
	tPAg66uNiAjOsULIE8c2Cgx3sHmAW+uM+4LKHeqVj/vrYq/xSwHorB9VC2QRQrNtnGG8v6KdzAD
	bwBr+BM9qBtsuUJRLzIuodOtc8q9/l0XNbcR7zGrEJ4iWL2NCrRjqpEwfaG6Ttw0MQFvKbflE4H
	8TMpm6CXxF9a3iCuSplXxPxdIMq+5CcsqcasHm8g7+Bp/H3jOS7RaBM6oXV8s1FHO1FcFr8bKsH
	3n56GgrUH2CZ09gRQ9zZPNwVhfW04WM05gQ3pwdM63PKCEKBcARyeV7hKBidEyR+LqIvT5M6j58
	wLhe/itCiSlDSunKnFpAAQnG0w46daeqcUWNXXpboCQtwR44UBHHWUAnNuivaO3bkMFHDr7Kb6u
	TY+QIqIcPziHAm
X-Received: by 2002:a05:6102:54a6:b0:785:e069:6c5 with SMTP id ada2fe7eead31-790776ffba8mr1802159137.8.1788979287033;
        Wed, 09 Sep 2026 11:41:27 -0700 (PDT)
X-Received: by 2002:a05:6102:54a6:b0:785:e069:6c5 with SMTP id ada2fe7eead31-790776ffba8mr1802145137.8.1788979286652;
        Wed, 09 Sep 2026 11:41:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a372e9efadsm42002251fa.39.2026.09.09.11.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 11:41:25 -0700 (PDT)
Date: Wed, 9 Sep 2026 21:41:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Georgi Djakov <djakov@kernel.org>, Evan Green <evgreen@chromium.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Adam Skladowski <a39.skl@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 4/6] interconnect: qcom: icc-rpm: Program SMD RPM
 auxiliary QoS ports
Message-ID: <opmidp5oqmpamjp2hucf6nkn2o6qpjtvgvreoyjbspyu3aa4de@wul3j6n52uju>
References: <20260909-topic-icc_rpm_smd_qol-v1-0-6dc5b5e97626@oss.qualcomm.com>
 <20260909-topic-icc_rpm_smd_qol-v1-4-6dc5b5e97626@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909-topic-icc_rpm_smd_qol-v1-4-6dc5b5e97626@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDIwOSBTYWx0ZWRfX923i2GVjM+/m
 6gly5iIfbeT9OqVMwnn4OEROney57K3X9M35GWQaQQxd5vHl2KaJJwfHZH+nLCWquREkFKrXJ89
 kdHTBTaywRC2ufzoIofqn2XdK8BYYMCkwhRu2gSTtIxt3cnTNuwQqDRn9nXCUtqFsTLNV8xUzmF
 3r0i9zSwesrfjYiT4LK6bvMO5y1HkIfvVT5Ts2mfSLaImrg2WCKxwE2RPUlrrvPzC1QeankHX1U
 /eeUErauqcW9P7BaEHeuZljx2T/cFwI+0mrJnouBX4Sm5bi5CkCJh1SZB6VvEz50kDf1QWaysir
 nPpY9UFlfC9WTmHoVTuGMMHpIr1N5t5KxNr0wx5XlMHHXg6GNWlaJrt2UGU+EJKbCS46L3jiDYL
 mDwZiqjdzo8F8tWRpFUWapglVK5IiA==
X-Authority-Analysis: v=2.4 cv=H5pOUOYi c=1 sm=1 tr=0 ts=6aa1a987 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=WdMRlMAzhO2SUoSbdeQA:9 a=CjuIK1q_8ugA:10 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDIwOSBTYWx0ZWRfX4R+BZXk0nsVI
 BaBVQHnzNTuns3NSEkTmilUVvTEZoTuiuRBKXGs50dHg9iR5sVwLuLpjRaidfd+sAygLWoy6BRV
 61vQtU1HFaPmQQQBEj6wcrLgP8GmA7k=
X-Proofpoint-GUID: zBtsrq0Is5XvpMX408hof5LJa4Il6dm9
X-Proofpoint-ORIG-GUID: zBtsrq0Is5XvpMX408hof5LJa4Il6dm9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2609040000 definitions=main-2609090209

On Wed, Sep 09, 2026 at 06:41:57PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Some SMD RPM interconnect nodes own two QoS ports. Currently, the code
> only takes care of one, leaving some endpoints partially unconfigured.
> 
> Keep qos_port as the primary port and describe the optional second port
> with aux_qos_port.
> 
> Assisted-by: LLM
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/interconnect/qcom/icc-rpm.c | 82 ++++++++++++++++++++++++++++++++-----
>  drivers/interconnect/qcom/icc-rpm.h |  2 +
>  2 files changed, 73 insertions(+), 11 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
