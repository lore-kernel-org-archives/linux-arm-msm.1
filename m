Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A323AE1A0
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 08:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791880746; cv=none; b=OZdUeLuu7JoB+N2tsJWPejroLAnZD7IOH5NtH138sUZtTyotF2NDoMwyvx13k7wxuWaerB0u6yxt7OnzyUH8xOkuXciLFibbdM77Ot75nmmsZu21kj4bVF/YNRR8OASgudtbuIaxVW9+6y0TbZzLHaBas9jWJvHWovzM9EEsy80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791880746; c=relaxed/simple;
	bh=y7b1H5eMoGHHxWnP+MPdqBm0Onvie0cMWtX+Y94jw9o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dCEksSIiZTJtrDwlcifwu2bpjZDoQVQ1HaRImYlfbiCxBCs0sxFzOf5Ai0IzGb7qqHjqGtNLcjlK6lE0NK7KuWDPMWSbDse8ymT+KGC8NjNGHFLNT9q0Gufvv47JmXoEt7hcWoGrBiit7F3BbVAe9F5QewFD1dZ+Y1ikOF+4iJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KSjvPnmq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PTYlS07Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KSjvPnmq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PTYlS07Y"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8B23Y922923
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 08:39:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3Xym/DZ+g/6IQxzRYSJGakzn
	fsaL59tm9tBWPakMDTo=; b=KSjvPnmqP590luNJXlnhgBCAahN5R4EvafLbOvLW
	rmCZhHnwIbbfidYTAcpOjMvCvkcBHe41NwPapmwWPHpyxdUrmXIdcIhw4AgvSbmf
	KK0M1FbWkX3Hl/gjBs3h4yUUFYLMP4I0bpFOYYrg/ajHN4WW9+KLnTJQoZb1zbgd
	2h5JHEaEHTVwHyK5qG76ogotZ/qYFViLaZlb4LG3ja6AkCZTLziryNVrDtJ3w3W2
	p6I0C+j4w7Sti6MnSqWGeM0+XAfFBzpLhKFpb74F9UanAmvlYztEV8Yvgl7WROWy
	hV3xMAeAEEXkLQmMXZGADU8J9SGpcdXr2QkK8n8DgpW2GQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h98h1syw9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 08:39:04 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93e92aad34aso517013785a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 01:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791880744; x=1792485544; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3Xym/DZ+g/6IQxzRYSJGakznfsaL59tm9tBWPakMDTo=;
        b=PTYlS07Yeetw0Ol7h0PQ97CdlhMzswPiAz4I5PtURojK3DtJvgUv/Y9jHeZ6lRsZOL
         xJcBxdXk7d1/nCYRnoibnxqPo/yz6ufbGLLxNeqKP9NpQpHfRJeelKi+XqWDQXR1zxlY
         koTSyl11Wnc5Pn4jOXdan07h1TjXlrNP5vRbWnEX22ClnYrlZsGlIzeSIoQPOipcpDNm
         45Mbp1kv3ctjEL/Th4Ngd1W4J3h5BR892ajGMK5qQsi1Se2EaPnODMo3xTd5Fupmx5yk
         +tt3Jlm8/qBbplDM+OrN1FQiMnnIshGhM3eUZ/bqwT3fZv/jYaS1UyCvSep8eMNSmYAA
         jcWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791880744; x=1792485544;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3Xym/DZ+g/6IQxzRYSJGakznfsaL59tm9tBWPakMDTo=;
        b=VO9YR5dlIh0fhBxv4ittpj4fOvhWceUr53MZrElYjewRyLpCRelmMgzK1eTgL0fNaI
         lU12pods6nZayUS6NTAco8NPEwnLW/XQ+8XwOo2oWtM+BLw6905kK0rhVHnq4fOir/En
         3qiA9TFWivlqfZog39ZNX9G5ZY/wznwD7NT6/v4KaY+HfuZLAhe4XZKKeYnzY9AaiIGM
         Xy21iaK4hwijSBg2a8og/zwe/SW27QCszSLFboGroxDm0f1L4bsnffkcSSZoMxIaJ8Cc
         lnJM6vvMZLTwAH8BhX5t+K/PljpBy9VFoRR+vWEnAr0JSYSiBP04Mc+biWjsPMfKeM1A
         QMdA==
X-Forwarded-Encrypted: i=1; AKwUvBw2KMJ0Hnnk4L/na5elT9fYBcueskEhbgWKv2zKjwnmdoj2vt8q6X8K47OSXl7ct7z1HzguWO+6o3H3anga@vger.kernel.org
X-Gm-Message-State: AFq9FYKZ3R7mfjmFfwjcyVIt+3p8lOOAOq9qD6PBwMhjF9xIEwoj3Xub
	8hYCiNe/xRruFNChhfYQjE7BFOxg0885MM6CSi7akTbM+DgF/AkBApBr2hQtVyTHOYhpwiZjth/
	RBVn42dM9qSg5IzQ8VT7xT17nbpyk8mhrh89Jdpwa5qLZCSW2eaUEhY8x+xqNTjCfYdSKudpofG
	ST
X-Gm-Gg: AYBFou1kAHqS5gcvbPut+Znl27Dq7Vlss5BeNIEF3JkuKeahjkv+k4Ca6lSeBSTp5Ta
	DZdtB4p6TMpVMD3pAMhxJy3cKWjw1xBUBgglpxg4msI61PleJD5UHUbXznLBS7GxMQ7eQYQPNoQ
	o58pb+MnWQztSG/+92pWeZtLwJsNfJ+CeTkxEEJ92FKx2yvUzr9bMXBi7xkqyCAQyRr5MCTVX9G
	+6bKrswVWn7DLp+lkV81qbOySQYDPPetxh+00tqG0AilADUJRGmw7tcIIvP4nXFM+Tv7MYncrOP
	VXyD1wpEvpRx4tPBWQ31lW/SDGx1xaL75MerhLij62sb7AbZ/6VdXQ2rwo8FINHMP99tihWoaT6
	oj1QQm7NqbFUgHGc=
X-Received: by 2002:a05:620a:601b:b0:93b:ebd8:9147 with SMTP id af79cd13be357-93ebd1dc752mr1891619185a.18.1791880743792;
        Tue, 13 Oct 2026 01:39:03 -0700 (PDT)
X-Received: by 2002:a05:620a:601b:b0:93b:ebd8:9147 with SMTP id af79cd13be357-93ebd1dc752mr1891615685a.18.1791880743193;
        Tue, 13 Oct 2026 01:39:03 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18beabbd0sm400822425e9.12.2026.10.13.01.39.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 01:39:02 -0700 (PDT)
Date: Tue, 13 Oct 2026 11:39:01 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, mukesh.savaliya@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] soc: qcom: geni-se: Avoid redundant transfer mode
 selection
Message-ID: <u3lk6fhmdelj5vuhnef4cedaqhkcin3o5kglgf7ekuokh6pveo@y5zcfzp5gt4z>
References: <20261012-cache-se-mode-v1-0-22945ed0da29@oss.qualcomm.com>
 <20261012-cache-se-mode-v1-2-22945ed0da29@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012-cache-se-mode-v1-2-22945ed0da29@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=VqC2kO2n c=1 sm=1 tr=0 ts=6acdee28 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Rt3kCFFBWhWisHNmluDamg==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=kRtKfVTYjSbh4cafFG8A:9 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: qER31DCu4GpObdQhn2hMUWMdpBUMrBN5
X-Proofpoint-ORIG-GUID: qER31DCu4GpObdQhn2hMUWMdpBUMrBN5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzNCBTYWx0ZWRfX2YtkS1FtRXxx
 1R2h9x1r/0CZ4LnKxRZELS07+nRdHNBx/JA9PcLimkwlkIwuZH+TuXRFwsS6cjGPZXw97mQWUv2
 FZ+f4L2kMs11rcyOjYg9qYdDI4O3Mjs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzNCBTYWx0ZWRfX0Dn52wGHT/h9
 DQU3IzmPnpe0m05v6P+kY9bklLjsE7V5YrXj7QvwFmhDde1uEBgHhO9/8bql3U6iArHnqy6qasW
 FGYBePzEh2DU1/S5mDFZGS1Q4cVMdWBQBQtbJf9MCAfiPwbnJiETHAMTYirJolxwBVkPg03q5TX
 qNfS5sEuoYRVOsxCf0chjtT8iYFmwp6tsOiXMuI12bwz+S3l1+En1ZBJUD39z1/f05p62emccKf
 qhDs4j0lNDvfSJ6Ra7VSaNKrQB7xA/Sjj+ozUr7WO/6uO/9L511jtFOxJH0qhriqds3PTcrOc2y
 OZkfYy5B8kNAcYYNGkykRVL8jgE7q41hn+hMPewQ/9OXUQpZZKR37i71qT7EsjP6CkC3r3Zx9Oq
 XBZ3syszbwIK0gYRoDbQwI+yHRTHlnXEn8ev89Gp0YhKiScrBmCydi6936zKyxk7DnUfXpxstLp
 o7LfT8j92Fyv8A8P+qg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130034

On 26-10-12 17:50:22, Viken Dadhaniya wrote:
> geni_se_select_mode() is called for every FIFO and SE-DMA transfer, even
> when the serial engine is already configured for the requested mode. Each
> call clears interrupt status and accesses mode-related registers, causing
> unnecessary MMIO operations on the transfer path.
> 
> Cache the previously selected mode and skip only redundant mode
> programming. Preserve pending interrupt status cleanup and GPI event
> routing. Invalidate the cache from geni_se_init(). Update it only after a
> valid mode selection.
> 
> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
