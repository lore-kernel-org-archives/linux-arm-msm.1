Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59CCE33D6D5
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789372153; cv=none; b=GtgYK+u+Q8IfUQzXuBI6YIxKH9+HiihUfMSZ3cIPxINlHbiuP/v821FC3aOEuFiwCEg7zMILM9xYMl7HKGfj2wzz922pyyJ+YLBG5W7Fh8PYKrxot5N4XnAGT4Rr0DkxawAKa/jtmzCUxgfNvmYoOmjkhfPZ8zs6iQPP2Ma43dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789372153; c=relaxed/simple;
	bh=F1VjdFSl9/atwZ3hE3R7ac4wdUgSa2oHodjWqqw69dI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ULaGmDCfP67UzhKKrVhS6AY6K5JqGQ2QYscbZvC0CHh2Q+OY9aew2UdBB/SYl+rgU7q5tEnzciawe9ETcMv8TxZEiK0parPW3IhDSNLxDYN+KkcDN8q5gd0pXxLAFJtyu7Tnk/3zTU1BJYUzV1FUYCn8bXqoyAAx0kolH8XXnpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j4dK/xei; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FgHtqNjb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j4dK/xei";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FgHtqNjb"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5j4eD063677
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:49:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZjLBQtd7svl9wuiVQ5/yYYCt
	Te6o0rbws3eQ4NEqK+4=; b=j4dK/xeiOzAb+5QAa/E2Fq28tsoKLnCeLalYD6L6
	mSfppLO0hQVNqP7uOVQAZkeco4fdb+9zcxJ5B1RBzuCLsLqI9nPyBawp8OCIiTjQ
	reBwH8gh4WztHsfYWPxzHUvpD4SBtzzjaEzzoZASCz8FmSHeDJgXjIrzxBR02fqF
	LSQ8rJjrRD08Ejq0xnWdEzrr0WqHpbQXkOjekPzOA7eWqgtNo7FlR7tl1BG7bLsj
	fyi9vcDalCg3FHsQ/aUnrmeoHkFsm1cq/wNYxq/z4zbM14NB9RHPSatq7IgmECrz
	Ur4LZ38JD7GNQfMERrGTglVNT1p7d483x0ryEeVhd81XMw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9dnn10-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:49:11 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93918756165so560208085a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 00:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789372150; x=1789976950; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZjLBQtd7svl9wuiVQ5/yYYCtTe6o0rbws3eQ4NEqK+4=;
        b=FgHtqNjboUmmP75ipeYWdXrj/HrISfMk899Rw8FWVfb6s/wtk9g3lZMjJ/18F7fmxh
         J6MUmNUzPhdAhbMXcyCjPSDDfx8O/L3M00xq56t5Zv3n5MigvA3DGNxgJ/+UdY/btaaR
         CLn/5ysJ6HJJRa+ZE/tS0Yc92MlE4eDChmWkH6OifDlQC5//sheFOa8tDQQ3Y3RxI8ZR
         KvkRamPlp7mVLINLuT2oyMnrdnbNBjJ+1cS0icUb7CFwiYmZ3n0YbI/jyqKRopGu3d8U
         SQf1hVWnf6GbsOZJIwwy/+TlsGcI5PYnbrdB4g1zTnVdFmKIk39SwCTuvdbCcVsMmmnd
         rwAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789372150; x=1789976950;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZjLBQtd7svl9wuiVQ5/yYYCtTe6o0rbws3eQ4NEqK+4=;
        b=QxzgSXRh7YY9SU609OL+uqrFty6KNWBW99HIQm2wakxwJx1n48QurQAFL42iC7G7kM
         jcbwPzxGXP3QSnR2crkTtdGbDVbSx9t+Faews4olwVwFqOs7OjMDGbM3iW5OSjcZvF2I
         V4L2gviJrqtRxzCCdXZTxET26jaR6XiRwaaeDxvHCha98f3dfu/d2qq7IhvSGCJDpzVg
         DEao2LRln0jGk7fDtLQEHKfD8Kv6/9cnhLt/Hz13SHfwqzO2Y8PeKbisjFlvTBrTvGTu
         qOnfy5WCemXSsMHKH1L4Z6nX/M4C5TX8FEujZhzV7Qk0iZki8p9MOqp8gFofPE7lXEvl
         iaAA==
X-Forwarded-Encrypted: i=1; AKwUvBxjEFV1lg8w4T2sPcPZxmb+2iqv5J0pjRdshh1HAv+9AQGJTwzKKjbZ/1FnTfqIZMSGPjeultey9wu6w0m9@vger.kernel.org
X-Gm-Message-State: AFuF++mYe1DN7wSw57Ud/drYBAhBrhy/zclkJxQLPxKWl0cn0uEgOQmR
	r+pVrxerGCMVFI2kxyMTiZ+0qapzcLem8g/gSb/yymlMxRZAkznAHYd4Qtp2C7dcA/OHDAhU82t
	UNcOoAyqcmyE2hNQcWxvQiJFet1iyaSC/oZ5KN1TB55zTa7db/n/2SAebBNYEwp3gSrCH
X-Gm-Gg: AYBFou0YBPwMzZWNiwspS+wbndyamMLW4B5c/pCset/xVqMCLALbXVv6b1/2tc2SCcC
	3F9btGnT89/DS9HptACMxdQsjCjP2CElkl6e+tKFrjXhRDfkFU2Nzg7Vi54ogVFB465k0vpb6oM
	lciOzQ8SxSiGSo8KJybpoZjaFoloFvfRpDYnL1XNkj7bFcRL9liwXWTI4OJW/exSbw+vZKQLp4w
	kx1iDD06V35bfgMMuXNU+XzEW7RlJcFzr+o6GoA9slAtsvujJRSvsB9bFav284D/bXGJJCjB1lY
	POA4CyIdAIcSNwr0tTix1sseLcZ4GZ8ItF8obh/l12bTRGLLCBcK3jrNaycL5mfzjSa9Eimx87r
	JI1tTq4YaFQSgtA==
X-Received: by 2002:a05:620a:6886:b0:939:9b1c:ea4c with SMTP id af79cd13be357-93a29975ae2mr193489885a.28.1789372150493;
        Mon, 14 Sep 2026 00:49:10 -0700 (PDT)
X-Received: by 2002:a05:620a:6886:b0:939:9b1c:ea4c with SMTP id af79cd13be357-93a29975ae2mr193487585a.28.1789372150065;
        Mon, 14 Sep 2026 00:49:10 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb2ecfc3sm24108231f8f.4.2026.09.14.00.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:49:09 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:49:07 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Ulf Hansson <ulfh@kernel.org>, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pmdomain: core: Fall back to node name for idle states
Message-ID: <algsevh27dlkxbqfwxogx4irhkxs5ps2itl22t2idupk4b34d3@zdh3kibxt22p>
References: <20260914-pmdomain-idle-state-name-fallback-v1-1-e4242c409a0b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-pmdomain-idle-state-name-fallback-v1-1-e4242c409a0b@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDExMCBTYWx0ZWRfX63hRibjodeu9
 iE7EHxDwpbxDMPe0loDa4O+3BcJsR5zDcr2J1x9wcHcBK9t6oPMK2pjg7F/P10RGWt1vIULcrfc
 G/b7MHC/v84jZm0S+CCDcnytqQl5LukQu9Thc1CM/0Yuebc7E087qIlHpOIgNSwmxV4CP8kzWIH
 q4qm9CYOg/BcgM2PlllfUOD8h9hbgbVB25ua6QXOoXmLD3zrUCrYdMxQ5f4rXLGFlBCpXQRCwM7
 DxuS/RKzFXeTmg12om7oTzFK0XkgPq/YDFtRb8fcadyDwhbnsvoLDdtFlyz3T64PPPUUmfEGl01
 W0HlpZUNWSGyejNTFrA9dZDgQs1KQyXMCn4EJomfPHB+ZAXoP6A9tiHP0ob3XlqQVW9PjSe8QAF
 L66Lk2TJ4Lg0M9SyEfY3LjUasA5kE18btqPWSOwG+zACzn7DG3xILdtcpJJIWOCNw034eztXldC
 LcGstkXcgykciI9y1kQ==
X-Proofpoint-ORIG-GUID: egsWdem-KzRHGT_9hskXARwLohMZe6U6
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDExMCBTYWx0ZWRfXyybwhlZjjN56
 Kule2QdBwMKDKX7sQyJmVqoTlYtXihCE9lumhPy1/cOMLKEm7B6M6KJDD7H80kbcN0pZZSV4fcp
 JDkmp1In442erM7Zx3Og9zkjOQ7bJ+o=
X-Authority-Analysis: v=2.4 cv=Y6htIReN c=1 sm=1 tr=0 ts=6aa7a6f7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=5kt61lt8hwMnmxBZRvwA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: egsWdem-KzRHGT_9hskXARwLohMZe6U6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 impostorscore=0
 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140110

On 26-09-14 12:24:25, Maulik Shah wrote:
> The dt_idle_states uses idle-state-name when available and when missing
> falls back to the node name. Do the same for domain-idle-states.
> 
> This lets pmdomain idle_states_desc debugfs show a name even when
> idle-state-name is omitted.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
