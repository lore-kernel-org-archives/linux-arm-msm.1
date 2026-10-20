Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792481748;
	b=E0ES2ECrI3VoQ+UFdpXkquTbs6qGsI0onBRmwqtsyJklfARQHoXmQeVkR9AHABFZa2EU
	 H4KTA08RAxFxGAuqzw6UYDDPH0rC0dUJV/efx1tVY8VN2JezOYfO79tVI9eUo8M7swSgH
	 ZCX+QjFmpraNF8CUiYFHTXVdr3OEXi9vWFy/VBW+f+hQiJ/O35HJ+/6rzjmFJuZVysyyC
	 r3bSpCcW7MMFVz3/cS1Ov+OpVKcgSnFeWgmNRqd8nDTJCvIA2oB/bOdjmQnQZE/Z3nx+Y
	 qjeLEga/So6a5cg/tHGPiGwM1KKEYzzDm3zE5JDiNjY4nL9gpcCBIlUT22xVAeWLSPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792481748;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=sVr5REFVEeGT7e8MzK6CG6XlPi5ZfjO4MxQbBe1hJxs=;
	b=4c+6OBHoLRyMi+KpzacW0NPhcN0uqWoKr9dpPxbmlkYVj+B7J8MgGy4aIPHat9L68Srh
	 NrM+MvnmzAHBBzOYS/acziQtt3UJVyrRTu4qqwAv+CwOGFHRIIkeDXItdXmZ1CXiGH+j4
	 lOsHX8uCUr61LWdwImg+jBnHeF059YdIw2Vo17bzjTaslQSpOx6+mT7m55664oqLMJvQp
	 P++QbxgHFsPOVrpkcRnFaBgirhDWQ/GQAIbb0V2eBL4qQv07HmNt57OO4sYLeqeqGtsNi
	 KkIAAgHOZREmhNhaIkDV68AApMpvFiINmoMX729daVAyx4qt0wjoCBg/beZuBqmUwNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XaEGjjlk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PakVn4u0;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D4B606A319
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 07:35:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2D4B606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XaEGjjlk;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PakVn4u0
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tTAp3306628
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 07:35:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sVr5REFVEeGT7e8MzK6CG6XlPi5ZfjO4MxQbBe1hJxs=; b=XaEGjjlkPyeip8/D
	Pd3y0fGZBsDnL6M/pphc6lNPtmn2W+306Vk0wjXgzQY6XAg5RSl3G0kmDsieeMTk
	Sh4y4Lo2FEcDM6TfYbRj9kZXSYpTPEjE6RF5An/eFrLDisemnG5ak5sZvOcqSpUt
	hfJwW/zM3odC9itOexU4Go0F7ZXfilfoKb4v7mJtYLGoCi/5M0IuXnn2JL89d+SN
	t3L0yng8nfE/RCVBM/o7TDLgpEFUAj5jy9sDOs/tVgGjbAoKhHKrK8UtEVi/LXzb
	NAannXznf3dY3w789Ck0OCK+DHd5PBYnRc6dEtG8GJjxW0rLAiUQ2s7NUAyRdSnn
	k0ennw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5sscc8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 07:35:46 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-18ab3ee4935so1957528c88.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 00:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792481742; x=1793086542; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sVr5REFVEeGT7e8MzK6CG6XlPi5ZfjO4MxQbBe1hJxs=;
        b=PakVn4u0uoW+Jcgfy2hFwfnTF8rQYZgY+KtqlgpkemBSVLJ/R+7Be12Az7LHX+ZWWE
         Un6nFtuXoZfzApAc12qzL6pxnz73uaeVGU/sY3LwwAzhinjEr6u+/IrGYXEGdq3BJzBQ
         5QOeT2pUkBpmgGid+5KzQOTx8Wyu99iGMm/xpmsh0HoWhnPUDMeL/bE/uA+D8+ECkWap
         PsMkU7EQ3D6KfcAp6M39DLcyeiWBQLT3RMyXIM83K57YvjnMD8TNdgaGmZEx7QTUeiTZ
         VxfjyRoQUX2XHnodZHCDXdFwnCIALcPbsprnj6BsYPzT90qiGXrel/T2+RnxL+lis44r
         EH7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792481742; x=1793086542;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sVr5REFVEeGT7e8MzK6CG6XlPi5ZfjO4MxQbBe1hJxs=;
        b=CONIcIE6VqPuOXLZ0EAbFZTCG/r05Z1V1+DYBhuOxK5ct7M+noPVhD/M+A9IHdsXXl
         EemG37V4uKv9VlS++tOuSRBoVkp7+ufYDgRePMtKi7xFE20uQSoF17botKe7eIYL24CL
         I6Vu71LfBzkqBONO/oGuha4QrkEHC9RQPkjBnAZh00i5jY0CmqF1iuP6XNazbwOKHhD7
         DNig/EbLUDJdRat4RVsF+ZtNSpyhQFjDEyQWpZRqLTt6YMXzz7xZUDzfBVQQIPliB1m4
         sP7PSHWDUP54IW5EdoDw0KZjEpQmyNH02mncLXCocD33kMSmUlHJDCPHCSBjk9+P2xCM
         EYxA==
X-Gm-Message-State: AFq9FYJZNIqJwHCQ8lHhkLhFTjfdtn7KDWf9sxkAE/p4A4ysxMjXe/is
	QOIs/wJFD8FXtnFphs/byj2R1OPL8l5wuW2+b1ymDyVdsqSokmYssEc+DaEbKUz4vtj/MxCtz+j
	cn3KvPbF2eweY4DYGvmlnGciaVp15lguM34vYybtEBFacSL1OLJWDfk82MOlZvrgaFYqIpbvbmq
	le
X-Gm-Gg: AYBFou3Smqi6DITbP5FVcHN2vyOIHaEwT+iy48xICEm/3OkmocceG1lUmrLuFJF2jJX
	PUg3dSXi2VbqIxogGJQc+dFIx2P/DcEyKK9Ncw/pXG6kbXxjme9Sv4Wri90MoQCqhG+PkAG6EDb
	bFYgrZFgpH/EenXIOTJHKYU8yHwB/M+ewuOMsgrtfUaizCnVCwt/bpXRrd7jybrFRdFx+9PRxk+
	RenRwddIHuPdHq0vZTlQL4CTCaPO1NcaJF69sikVrdVol1jD6g6+LTl1Hd5UgGIWhGh0xzxrqJr
	BH9MfZaFZwV7Kx9HqPF5k85jf4DR1nM5Nf1eQBlEbNOvTcFiQyHvqT9m+4BuYUAA4wjadYsamtd
	2VNl8i/QlOoHz0rpY6PwWH13G3/g9VPY=
X-Received: by 2002:a05:7022:eb44:10b0:14e:d0ba:7569 with SMTP id a92af1059eb24-1850c502379mr14549926c88.6.1792481740732;
        Tue, 20 Oct 2026 00:35:40 -0700 (PDT)
X-Received: by 2002:a05:7022:eb44:10b0:14e:d0ba:7569 with SMTP id a92af1059eb24-1850c502379mr14549899c88.6.1792481740204;
        Tue, 20 Oct 2026 00:35:40 -0700 (PDT)
Received: from [10.216.21.16] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831c5cb39esm36257771c88.22.2026.10.20.00.35.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 00:35:39 -0700 (PDT)
Message-ID: <d1ef564c-2031-477b-b318-426d472b80e6@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 13:05:35 +0530
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: pd-mapper: Add support for the Qualcomm Shikra
 SoC
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260728-shikra_pd_mapper-v1-1-a5572eca26e3@oss.qualcomm.com>
 <014f65d8-702f-4b45-8037-8c416ea8c858@oss.qualcomm.com>
Content-Language: en-US
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
In-Reply-To: <014f65d8-702f-4b45-8037-8c416ea8c858@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzMCBTYWx0ZWRfXzQvvTjSsO6Ea
 itsa/X5WkQ8G2PHUeE43hDtprrULwwsg/gsrJpqlkIp4yqLJiNNYuxqguXPYbBQSpBt2yVB0oKa
 FGCmtPP+RAbmMEwIsRbRc1U9PasbU2Bl3gXV/9KUxJ0hnbdQZwscNHansxFe64qF0rcJI8tzElh
 gtt4lTnMzbS0FvgzovZI93gHaA0dBPS3KpGoOZzwBZAnj1bfBnx8npdf07UTYVYxkFq/j2RBjV2
 d6pI5vM1SED38EAQRCPV8Y9ZkYCKWTxi/hrDLL2somRwlHBuGVE1JCPuaRzoO8X1xRPH4faRufM
 mPDNaJwdbnlqpva38kNb/ivGLJXyCbXurcw9Rf3K8ns6poREmVqWTztmJT9JWkUG1p8zqh5Mqm+
 qp2aoPKVFt1Vzge9rotIS7VKZ+LoZ5gIuY7QtxlftCVXoRajqPsf6T83Ma3koOQQ72H+FY6nIZz
 scID6S0LPAuqrojBjog==
X-Authority-Analysis: v=2.4 cv=fIusTpae c=1 sm=1 tr=0 ts=6ad719d2 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=ZLLkx3fnuknxs5wuvD0A:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: 0Gvz2vVDwJDBcEH_AJHmKXwk5uMgMFDG
X-Proofpoint-ORIG-GUID: 0Gvz2vVDwJDBcEH_AJHmKXwk5uMgMFDG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzMCBTYWx0ZWRfX2OOyY9q7qWvM
 BzNF9qjT2MH164aC1Odo/vcDtn8Jxw+6xQb53npBFj9uI7f1APgxYDqBCjS0ZI5lX8DozltRgJw
 BPCKOvoT4s53TzMWKOUE/JPANiQEfbU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200030

On 7/28/2026 3:43 PM, Konrad Dybcio wrote:
> On 7/28/26 11:52 AM, Anurag Pateriya wrote:
>> Add support for the Qualcomm Shikra SoC to the protection domain mapper.
>>
>> All Shikra SoC variants (CQM, CQS, IQS) share the same protection
>> domain requirements: mpss_wlan_pd.
>>
>> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
>> ---
> 
> I understand the audio domains are lacking since there is no more
> ADSP, but mpss_wlan_pd? cdsp_root_pd?
> 
> Konrad

Yes. I need to add cdsp_root_pd and mpss_root_pd
I will add it in v2.

For mpss, I already added mpss_wlan_pd. Mpss_root_pd share the same 
instance_id = 180 but register distinct domain paths (msm/modem/wlan_pd 
vs msm/modem/root_pd).

Clients subscribing to msm/modem/root_pd restart notifications require 
an explicit entry.

I will add mpss_root_pd to ensure complete coverage, consistent with 
other SoCs.


Thanks,
Anurag

