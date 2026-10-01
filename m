Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 109225208B0
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2026 15:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790867485; cv=none; b=SM6VH6LCg0VAXFnrX9FpanniFZEZtVtKS1+O5uESHgeI2dIlHsuK68ik2Gc61+raLUuob9uAf1HUCikUhCvNSK6BmSVTkU4HAcWgJluhdyjbF5pc6VgGZPEWY8sv2+0n3ciq+IFDHJcCcTdhA9yH89idUpAfapkAoZtxGD9zYj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790867485; c=relaxed/simple;
	bh=iYBzGParazZeDHgmm6OmKxdz2ZT6O24nTmp5HoaQ7xc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nzvuGe4Y844eMufzpa2t/o1zIsP2shwgcbnUhFxpRItkVTOzSdjIKlxV8Ic7TYbjf793kihQWrE6YG59VKAGIFCZcsrRNhxy6QQrCTg41z8VSVGTfVjCLvTLbSLYRi/zwg5fHiUo+affLbySVKB852buC69l6wVOVRv7GYku+JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uk2LgLKX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TuhOBZLY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uk2LgLKX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TuhOBZLY"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691Dk6m01856999
	for <linux-arm-msm@vger.kernel.org>; Thu, 1 Oct 2026 15:11:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iYBzGParazZeDHgmm6OmKxdz2ZT6O24nTmp5HoaQ7xc=; b=Uk2LgLKXwlosQNrL
	lM/U1nQlnjCv68l4yxb7IIXVi+aCxd94Hedfj1kJCkEm3sEeJMdW6hAOTNDntS2T
	HyF65uzhOjFf3/ZeZN3vD2DltxF0a9h6EWOjXVAloPl0DkKi0F6ch6u7T9zH2HId
	7JrEBWlKC4r/zZ5hALYb4wnIvCzsB1Pa10kzvEEpPsTlxgJMXI1qiAPgpnllDG6D
	g1919t7U7hCj2xftOqOnf33sPsnBQ9PLoIINTMY0LUariHvvhzBb5xaImxsb8+z/
	WaEk5JeVzpdun1n/FwfvIZENjTwmQOZD5VSWtVeGheI1/RK3ep/GHSr8BD5CI7sb
	pkzn/A==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h16wcvw8g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 15:11:22 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5d873da8093so26938e0c.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 08:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790867482; x=1791472282; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iYBzGParazZeDHgmm6OmKxdz2ZT6O24nTmp5HoaQ7xc=;
        b=TuhOBZLY7zUVs40nxdQIjT5+gglmCCFeHVn6Gxsx04NIDiHY6HeTazkGXDxNvOqPy0
         4isOv5j5IlTpbR1jhKRDot+31/t4jVx6JezRB91uEB1irEs2t3vEPn7CAzjQOvCzJxwG
         9z/c++T61znPjnOK75mOaM/qxQZfpNZ1bO8jmLdwzccfNXJyud/upUl7xDdeavkonVen
         wBOC80Jfsz0zY8d4gFf7wHfRrUtr+7J+lPooqkoJ0GLkRTBVnXkE+je0nAuqetuZubyG
         Zaf0zuOGEgNAFPC+5T4pbKfyTyDG8Z6pqRAcEsE42wdXWeCkujKUXuvYOI30LCMIeTXF
         caQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790867482; x=1791472282;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iYBzGParazZeDHgmm6OmKxdz2ZT6O24nTmp5HoaQ7xc=;
        b=dhd3YDl2s30MNXps8yqOhfkffF7C0MQC79IVjUJi5IvEB0MFCybg6wBNJcoms10hx6
         nwVPHYCvqqPnkjUkzQ3Tw2P6md2z/PDjWarYdyyGLE3u5j+SSdEvFzoqb8ge3kHTTLqR
         tpuOVU+n0leMouXnz7QJJiZn+kgLPz9rSufSYd4IATyEbqVgB1NXu2BUliv5UVoCuX6x
         D9JZiA+FE66GQT5osdN4NDEUsAso4j6B7UvISr6pcylvtv2XxaXJAfd+/m4etH20Vs8Z
         euZQU/GrEzbyqfxnQmPaishmDEmUyVcv3f3hCa2eZr7xgiYlJxere28pdKm6lZ5h4+xa
         Hzuw==
X-Gm-Message-State: AFq9FYJ/P9zxoW9ajvtUAv9+uDnadMrqfS2KljW1q8Cw945CZV6aEMJ4
	IFw5jKwgu/45FisRNaLTErGGMqsZ7YyXdWTpFEqcf1Z+LpNy5u1/0cwfnuwzkBLqUL/lk+boeeA
	71ziwJbnVhM+Dxq9gk28I8w46eHkCo8u5vSWlygijbMDTt22thVmLhju9tAca3uPtHA4O
X-Gm-Gg: AYBFou0HuU8cwNvIvgfx5gHiBRkHoHgqiXqLn4kOaBNsmR73yPVnntPtCpvRUrpBLO/
	Mr5EmXXpBaw5CWBzuJYWBeewSLVOWfmDr7IehV1/eK8fExkQDZCKF0hybuZQBBsT1m2OUv86Y2u
	djkGuMl/bNWbeMwCCGTcIhym8hSEXJnjbyye3qnE5h3lKRBAsOHL1EPghjEPBpjYER4+aYt40Ed
	D09JOIgubCPf4V+v/KrMRHR1yhi01yU282GfWfpnBLQ2XVUgACyQ3KdzGj/M6FI4VJlM8CtNMw+
	qNp7GgTBkyTvlxPLsWcCl3jqCljiwlsNKYksFX/QHtFI1nh7GPWBPYgrUpvNrBHsi57Bu+/GoR5
	syoURb6gISiDmB97HOmPksw==
X-Received: by 2002:a05:6102:6a8b:b0:7ae:544d:b50b with SMTP id ada2fe7eead31-7be72cb1e6emr1260221137.3.1790867482243;
        Thu, 01 Oct 2026 08:11:22 -0700 (PDT)
X-Received: by 2002:a05:6102:6a8b:b0:7ae:544d:b50b with SMTP id ada2fe7eead31-7be72cb1e6emr1260203137.3.1790867481730;
        Thu, 01 Oct 2026 08:11:21 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e31ce3ea9sm187363566b.32.2026.10.01.08.11.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 08:11:21 -0700 (PDT)
Message-ID: <20cfacef-2238-4967-a7f6-eff0e883df00@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 17:11:19 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] misc: fastrpc: map ADSP remote heap into remoteproc
 IOMMU domain
To: Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Amol Maheshwari <amahesh@qti.qualcomm.com>, quic_bkumar@quicinc.com,
        quic_chennak@quicinc.com
References: <20261001-fastrpc-kvm-iommu-v2-v2-1-6c32ad6f662f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261001-fastrpc-kvm-iommu-v2-v2-1-6c32ad6f662f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA2MCBTYWx0ZWRfX7/1GzxF08xlB
 4ud4eUPQeFswo8kGFxNtKVu5BFvjaFGnck+/y6Yvf2xWH2xa6TSbCL+hNbzCMLblF1kcDHT63bP
 J4NQI5EnWq4GiJHypp2oSjnf7sLET9DPVMFv/sFXoqygRktDMTpexpwR7cwaf8AYsXVqFeeqjpK
 jnEsqwRt+SuGb01Lig2msXhiHBrlDEu50KJsH7n0rKk0tPWRGIPaip8XQbAxPFyHokdU0HqFeEc
 IWQHz8NvsSMkk4IQPc0hoVfqsvZ+0YmUp08QIlO0l8SQ/zqXS1mfTFxI/Y4EZIBriI+DuuqMKjt
 7EHdGSv1H4BwO/vcKUUvJQkpLsa78tjrzTAUVn9wLf5xuUV7GWX2w/JQYCiSDp5M4Qp2n2EmC6Q
 y35oMCsvPZRr5XcPi2ZEIqOtsu8NVHAUGJaimZqBaIOAa8DP1l7Sm+P/gvELygvpUFRos60/Ges
 E2MItypiTAofgEhovUQ==
X-Proofpoint-GUID: Pmpo9dEmbakfc-7482FTTE17udwQ75Yj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA2MCBTYWx0ZWRfX0h4SMWeIs6ab
 JamZeYfXILgNJVv9Ik0y0DBLmMMQzmOWlwOvCGZhPjk2A/puBIGDs2+ljIq+M4Cl64VscYivU0E
 Hj0fl30djy6pIlz2ScR6gFCNI6pY76w=
X-Authority-Analysis: v=2.4 cv=S51MU4sP c=1 sm=1 tr=0 ts=6abe781a cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=JJHmHs2BdlmLsZ1y3_4A:9 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: Pmpo9dEmbakfc-7482FTTE17udwQ75Yj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010060

On 10/1/26 5:00 PM, Anandu Krishnan E wrote:
> On KVM-based targets the kernel runs at EL2 without a separate

"On Qualcomm platforms without Gunyah/QHEE"

Konrad
