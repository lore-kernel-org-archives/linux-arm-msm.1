Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64D427AC31
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 08:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789374396; cv=none; b=fYexQgjIzd+94tW9vk+URvwc/W2l81nEjEdVwi4Kibgp3To4GH/5LElsEGipn5FXwUnapE5kD+NvW1Q8U5szMXUmcujf8xNLqW+JD5/feT8wgQGDHZLiKeWhnm5Ua6ZzUZZKHuH1Y58dMY2jhrYIRxP0dkHz7wv2NpOWmZncsN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789374396; c=relaxed/simple;
	bh=AdtMOxjzaLIOo6KsD9vD4jUxBYk+vDmSNeDVBbDLj2g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HEe+opljbv8RzNA6T9pEwCgI3ELMMkphPeCCCBtXw+WKyT/csFw+WGYIc/ZBoaufQrICaFCUgrFdafoDBDQLDYv87vPJwttvv9hOeqd+gYergAfM0eD8No2ZzxgkX54TPdRf2g+wx+CbKIOlY7vc4m3lrmIVJgo5Ivngb/gSwi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Iw3mNtH/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a2DSfK8d; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Iw3mNtH/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a2DSfK8d"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5innX2627083
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 08:26:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yE9cXux7SWfKuln0nFstBwjBhpnZF2+pJbTjpUIW9l4=; b=Iw3mNtH/LZvPcp1N
	7NtBivXRcplxBJtpSppKCICl25OVBfWPBufO+qcNz5WdruToiZfMDTLJ07TjiVrF
	Acpz+yKPki4BJSU9gNHTDnfBtM6NEgizbjg9qHb0KR6OH5XvX/pQxHMqUlBfFr14
	vsjqQmjOhuacMhZF2a+q8wZvJzyv65mdIGo1E4T+e/UywarYNJM3pft00wZ8McV9
	pKc1Ks/12L4Iq0+6/u2oCW9BDD0csszYUfJcfh+vD4DwoU2K9+7nEbbFNxt7awMs
	akhnR0sEpUzTCSMfOS9/e8r4BkiJx5sYec0OxAYwids/0SUN0UeN1ZNeHy8bqObS
	LCMHsA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmywh5k5s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 08:26:33 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-938fd633df7so46296285a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 01:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789374393; x=1789979193; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yE9cXux7SWfKuln0nFstBwjBhpnZF2+pJbTjpUIW9l4=;
        b=a2DSfK8drzYSFskcY31Ch9PzwUv0tComl6DeTIKFYeYFUMGOZEtObsNDoqJxkjgonM
         8MCKVlG0rtmAugFoWemz6hKVFqeeNYt2Jcg55Vs+wHSRYJJkfL/yZdKHWipmacN/LfBz
         nkXFjs8uS+FU/DuU2kguvBjJI9R1XwKWqgWBBvxGw9L7OdcsKD2FFiBuBQ8Njyb73EG7
         ov5beoMmb6mMoz6fx6otZ97TT/OAJfUav7SKTDQzjMG3AN+IHXuWjmzbNrXGSjkDF9UB
         kIjurM25gwicTa7wJmMzoNAd58JpPHVLv3d2D52XZWqm7OYp7qnrqw++yqWzK1SQToPh
         TkFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789374393; x=1789979193;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yE9cXux7SWfKuln0nFstBwjBhpnZF2+pJbTjpUIW9l4=;
        b=R9Je4xPbXV8bGo2gKQAJM/R/txqAY32O/lwDeUnk9QTU02dlKZZCtBzvYl7x0q5pSn
         kNLp9xu01sfarNa5FoQGMBHA7FsNy2UvRp/ZpXBHRAyS0iMiu0Wu25uZQ3yZ5MX8UHnT
         GOPRle8gkRGEJd3FlxmF9EN2HtKheYYYBFkGwR+Wdkiz8k9rtMI4JnAGvlUVAc0g9KSg
         vzlAaFV+5cl6bX/S5j6kI1l8Na8NmEvOG2XsXCBhgkJ0qbeombasLLT/RIMz14W4CrBY
         VWAEj8zkeyK1fIm+zsPn0ppAiouMnzbYs21SCk+GJiFE0wWKzMTmByurBLNb74lfdzP/
         Hmew==
X-Forwarded-Encrypted: i=1; AKwUvBz4neUBRG3HeAwRpmyPEJYMU8gS4PaChHXsLNKSagKHkTToDwmgLsbqTqh0PhQLzJ+rBTVnvDpZ/EPSAE/y@vger.kernel.org
X-Gm-Message-State: AFuF++nH08y1pEop0TF8IGZD2Y5+ngEgd0tNOlap7Qvz5kz5Fl+raFCO
	75oJc4bpJOSjuQSKeMDmm64Q2rub1SZodjbJpH/7tt9nmflD7DJQPNW4DenAm9AauREPV7V1BbL
	18RJkSrzw8kPC67qPJuBKCFSrxevRSOi3bLSGy0kQx7cf1HaZlnpsxFDY+fT/nvPY9LyczL0X/P
	KC
X-Gm-Gg: AYBFou1E644qsutl3ji+NGMqTA1vI8qRL7it3oUDlEJPKQo5mvjFW+Bthxcipgx8oF6
	qI3nOkm01XcaGYQrqnEIKi4Fp6XzsuAux0aXKDyAmcoPdbyp4b45QUViucjaupcR5YbKBKgiTsZ
	UDVMpBm/eUuLojR/BemWgQKwIx82Ai1TGRGMMbHgCuyHecOxrguZrE6WYxSD5mInamISuQrhNOS
	B/N6/FKrN6xnlp76+aWRTsRRivpsYwLgClsyw3br8k3jdjAjFKHPpU+a84p17j3SlqICYA+CPZv
	bdaDXVbktaap1+XJYT4AuKjSDawN/MeuyyMVOYzyCax/wovpOxJDqAJ4VVRvzNkWDeTnbHDl84r
	Dhm1QNNq4glmPql8oTV7pdg==
X-Received: by 2002:a05:620a:6018:b0:939:47f4:935a with SMTP id af79cd13be357-93a29c955b9mr150435885a.5.1789374392712;
        Mon, 14 Sep 2026 01:26:32 -0700 (PDT)
X-Received: by 2002:a05:620a:6018:b0:939:47f4:935a with SMTP id af79cd13be357-93a29c955b9mr150434085a.5.1789374392239;
        Mon, 14 Sep 2026 01:26:32 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29660ba623sm400996666b.45.2026.09.14.01.26.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 01:26:31 -0700 (PDT)
Message-ID: <ad4496c9-e438-4c4d-8089-0342251902df@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 10:26:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] soc: qcom: pmic_pdcharger_ulog: prevent work requeue
 during remove
To: Yibo Tan <lhfff@tju.edu.cn>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260912161210.1683266-1-lhfff@tju.edu.cn>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260912161210.1683266-1-lhfff@tju.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 1IAZ_F89v5SMIn8cI8fhVnG-lfa6gi2G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDExOSBTYWx0ZWRfXwN0fOMR68bWR
 WWqxxYgdwJKIJe9G9MSOXenYdk8v+h/fWdZ2DK0mBLsGReBy0m3kGCIwDbzb/L+kZ6k0g4uvvMb
 TDsBIV46k6aj6gT0Ro/qrTdOhjmPNI90hZ3bMj3jQc+SVy9Hl9QycaJjVPkjbdichSBPPDLHfbc
 17m8rYsnAGmzKrX8GHIgdgM+jY1IhnhaAhi8ZvZfYIoE28oGbyo8f/BlO5nFignLpXclNH9gQrV
 XlHAGtAide/iuV0pCBo2xgsObNjCViAabRvhcJtvvM4OJ+evlqJ6zxKI2ZaVrwKusdOvFrdBRMK
 5h9etuzKmOACxj82ZuGpaYZUhwCenNc3+aB6dN7GyHMVKGKK5ot8iNcNHn0zKtKeWBJvMHu86SA
 r8yOUhIILsRtftdZ6HzpJncnZ4B831/sJMS7lDHvBjGgsxTj9cEGzfiUNCOdfu509Kx3mXW9L0w
 4KB5y3Ov2zfcRbtKBrA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDExOSBTYWx0ZWRfX/8LZOZcspiZ+
 55kQOfoOikmzfKIaMSRsLTxYiRfhIu7zrXX3T0lM1pJUR3y4DB41mzvQR+IAIpyRnvQH9BigC+C
 4aqX37tAvysaU2bF4JWkR2CNBP602P0=
X-Proofpoint-ORIG-GUID: 1IAZ_F89v5SMIn8cI8fhVnG-lfa6gi2G
X-Authority-Analysis: v=2.4 cv=PsUG/AM3 c=1 sm=1 tr=0 ts=6aa7afb9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=yWPM8P6GVKE6enYag9kA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140119

On 9/12/26 6:12 PM, Yibo Tan wrote:
> pmic_pdcharger_ulog_rpmsg_remove() cancels the delayed worker while the
> RPMsg endpoint can still deliver callbacks. The RPMsg core invokes the
> driver remove callback before destroying the endpoint, so a response
> callback can run after cancel_delayed_work_sync() returns and queue the
> worker again.
> 
> Device cleanup then frees the devm-allocated pmic_pdcharger_ulog while the
> requeued delayed work still embeds and dereferences that object. KASAN
> reports a slab-use-after-free in pmic_pdcharger_ulog_work().
> 
> Use disable_delayed_work_sync() to drain the worker and reject queue
> attempts that race with removal.
> 
> The issue was reproduced in four of four runs with the real target driver,
> RPMsg bus removal, endpoint teardown, workqueue code and devres cleanup.
> The test provider delivered a valid response in the window between the
> driver remove callback and endpoint destruction. With this change, the
> same late callback occurred in four of four runs without a KASAN report,
> warning, Oops or panic.
> 
> The reproducer uses a test RPMsg provider to control the teardown timing.
> No unprivileged trigger or physical Qualcomm-device result is claimed.
> 
> Fixes: 086fdb48bc65 ("soc: qcom: add ADSP PDCharger ULOG driver")
> Assisted-by: Codex:GPT-5
> Signed-off-by: Yibo Tan <lhfff@tju.edu.cn>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
