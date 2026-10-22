Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792661271;
	b=AAFPVcs8JYe9Bl5B6v8zvfDtIwOrKkEByhUIDVnI+xzefn1PdsWxcoVY1/CgAQoKAPry
	 ie5xekSrxm6PJcc63RKn2RhIgcQJGhFGExaNDcOk7wlqjVYNv66ccknJvRyIkcryT29W2
	 5BflVL4GnBTqWEVxCY65rXbIGgFrZHfBemwKYTJCyHcKaURscH3PdaNrgEglymjQADGs1
	 pdNwDyt2+wyYzPFoa6F9IH8RTv8ZokvIoxOwFt7X6jeLScxP5AJSzD56++jQ82/9ip7h4
	 BR2sNUfVZQIGp9aUtN/dkJRptjZoekajDLERDvtOptXzd2uuwNel+dZzJ571dHn8JlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792661271;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IyT7fwjUNFNu0NAAjlLz6JQgqyL2WtB5iiNKLluFvCs=;
	b=K2yUkBqQACwKzOv254EdHdqLqakO4k1Jv5GiybSdzz3s2jyDuYxarNhmr+a5UTAtGGu5
	 BRY8q2u2axjDqLD47ON7aRWBZ12s96FdHJeUkLnNvlIin4cAa6WanZXquGlrY0oiZDldx
	 UGwZxfe8cacSe98e73iGCMvXSxkZL/GTRCnY45dHOcoyuzdCfG12rGfIZ/8nFjqOmTmvc
	 uZAByvF7xX4FD6zsQAenr+wv+6KDSivRp85zbxVsbjeKWD0vnKo5mlHsGeCSCMo4AVhto
	 nQ/U6vmU4pyw7yWysKB89RYVsClKvvxVdtn5x4ooFL+6C8LGfZcU5Q/j1dRhVxH/ZkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=B4AbYG7l;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="fUe90/x7";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF647606A31B
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:27:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF647606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=B4AbYG7l;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fUe90/x7
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M706WH4136595
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:27:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IyT7fwjUNFNu0NAAjlLz6JQgqyL2WtB5iiNKLluFvCs=; b=B4AbYG7lnrJgKWKL
	CUUYVPrPmNE4FBjdYSgr9aq+iBuZDvy0sDenENjOSKXWEHNqUOTtzs/L5Kn8y8O2
	WDkiTOtDdWKHHJD1s7FW6G06M9uKLGfYIrRk1nq+FlDKuyYbPhHz3Zkeg0gy0wRI
	0Um5szZwsNEGdxQuxJL+y4uCzkL7NC7NnyJ9TmOOPvXDwUK2ptMsWa/fa7D5Q5KN
	XYjiGFhjpemCyYc7Nzg9OVI5lWPHOmjzqcIAUqgisYdithFBlUZlc3MyrZKPV8D/
	LZTQjjpvqxQvCO6pYOHfZC5JNdYQ93scOC00E2rnDwa2EwF8Fnh8zBJ761i6c2PN
	AcaE6g==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93d9pn2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:27:45 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cd0e92d64a1so581382a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 02:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792661264; x=1793266064; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IyT7fwjUNFNu0NAAjlLz6JQgqyL2WtB5iiNKLluFvCs=;
        b=fUe90/x7h5NtO8907E0Vn48jVBFXS02qeXA1kT5Ytkto1Y0MxyFm4Qx546k/ErHQfL
         wtYc4oWP+ZzBnIU3Mr1/jDDvEhPrEC0ehwegzcZkXQu6IwdR33OAeAi3K6jNG0rXQjmz
         1EqF123mAFlL3nnC/hpDFEf95If/Ox/CVvOUc8qSR9scp4SLD90qojxXD1ijoCt3bccx
         zYRSL0R3igNGP6LjBeKrOYWM+iSfULDC+LEKy+T4gyMD2bUiSFQ4XemBCZPAVA+Covoh
         T01jP5m61iPtNmaH9o2QHeLj7Dr+NFF6iHV95JiS2Yqqjh4l0Z1Rzw6WinJSOdN9PfUQ
         b6VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792661264; x=1793266064;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IyT7fwjUNFNu0NAAjlLz6JQgqyL2WtB5iiNKLluFvCs=;
        b=pyWfIC4Ul8xvIx/W1cvatW1Wq+keCv6iSYEmgYknK08Zf4uwsryLgdPesez7m+4lhh
         5Ef8U+NDI7sPtV/tJKpzc3WAVCJTCzPT39w/WdaUUVp4rMJGzPfKoOFDt7P4Y34m/Hd4
         dqVwvaDU92UzYEo03uGzJV1Kqop0ZufAhHFuXTMUHm+WNkAq0piSv+eZXoOsstHbCc/o
         0jjzeJlkl/InDz8zkbiu4qFLmv2bEIqrV/Xo4yLKmM8Cse0hNcsm0BDJVXTdQjuokoTP
         eKqoM7shz78Vo0JpuXXw6xEZFZuJ632xAT42M0OT5dswPz04ITSq7zfqGRvijzjtbbUJ
         REdg==
X-Forwarded-Encrypted: i=1; AKwUvBzOIQD1QVlFOM25nFe523GssoIsqjMSh/QI11jgxItQl4HUMb0iajf63TALAtKk45IsU97+zTYjZvZz9DJS@vger.kernel.org
X-Gm-Message-State: AFq9FYIZ2wk2uVk/SgdjBkMIZAqIiNsr0D6KncTMN0fQa2ux5bkycL3y
	x/WqkVyPblYLP9QXU7GVb9VI+MUzJUW1ZdHLNWwasl70wkk+wjFkM57HiC1THpPaVb6O2sudjAE
	gFwXR78fS/oxaPqFeYmWEjL/2Qg9ugHslifYqQRHodnCWRz5b4koiGgJ1A983K08RmqNs
X-Gm-Gg: AYBFou3eOHmR+LLxcH/bMwL0APXfbiTGvyWJSeb9hkoixrKCJmEHmtDBeo8DJSXQ9gQ
	ROVMyP2pi6F92UJ/auceexk4GJrzc74QKrK53Bbizvwi9a0rB9l9AAfIEELuPxoI5cn6WLgTADv
	tPsCXs1rkPhAVraf7OWKbtXj84q4Q2xX65tsFzN2oH5djYUCwzOb3c8K7pU/yLQk7UlyUrrmsr9
	es9U9+p+qiGuUgSzDk8inW1PKJdtk5jYtAFnOXyGPQUx7aSQGemHbob4OKnjGCn57npf1L4WUwu
	8meODeTPyjfWRjWYbDKVwfVv16yyJ/9uZ/kLKhGhKXKPd/On/a369R169tkpVFbl2p8QtWxNmQi
	I/caI80i3ArWSSQ5MN61923uiHxdNRLAAZw==
X-Received: by 2002:a05:6a21:7317:b0:3e2:3de2:5947 with SMTP id adf61e73a8af0-3e2a09dde1fmr1349108637.16.1792661264461;
        Thu, 22 Oct 2026 02:27:44 -0700 (PDT)
X-Received: by 2002:a05:6a21:7317:b0:3e2:3de2:5947 with SMTP id adf61e73a8af0-3e2a09dde1fmr1349092637.16.1792661263974;
        Thu, 22 Oct 2026 02:27:43 -0700 (PDT)
Received: from [10.219.56.252] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd6b84831d3sm976688a12.10.2026.10.22.02.27.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 02:27:43 -0700 (PDT)
Message-ID: <28a4a452-340c-4ac6-afba-5cd39b370ceb@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 14:57:38 +0530
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
Subject: Re: [PATCH v1] arm64: dts: qcom: Remove FastRPC compute CB9 entries
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
        arnd@arndb.de
References: <20261016052042.3755352-1-abhinav.parihar@oss.qualcomm.com>
 <b0763841-cfe9-4355-b900-ae43d93dedf6@oss.qualcomm.com>
Content-Language: en-US
From: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>
In-Reply-To: <b0763841-cfe9-4355-b900-ae43d93dedf6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNyBTYWx0ZWRfX+M/MFAuuRxA5
 NwNDiK2OkY1c3a5JshwSzc5KO/+vOWA8QSKoBzuOjzaxMTssRI6z6KALLKTCFtMAjFf1I0ZeQ3A
 oOjcsvQhqr+5cwkygGRX7zVhL/BOBPI=
X-Proofpoint-ORIG-GUID: MtH31KTxiauIhGX2KvGZuo9p7iO4AyqX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNyBTYWx0ZWRfX/mTrj04V+kAg
 yqhyYNPrbpy9+ll0v7E+HEklVJhG4A/yAigb5LU5o4OBLvk9Su+7UIbVJPtAbzThWpOyLPQpVdK
 dB4mLXxXA4K4vE4zdeDkmzkrk3o6IdC0YdFsM9wnrYT7cCyTU4Y6jxECuiY2KBs/I2RcuKYnWtF
 nPSEBMGu5CxM7TKM5xIhyCT/pGo1yTpTHWjWTn1Pkm//I715Jl9Z8015WudGWgOMA42T9vK86oz
 44i9g+7tPqGPQOd9qVnkwh+t6DCEbDcDiEKcMdc1Ag5mzqyUpeTyMk//AAyzVGqj7Fx++HJ92mY
 myuk0dG1A+YTQFpZw/twe4E/0zFYSVvSgJaQx1qjhxXSr0QhhEhMPJkDpahW6qrB1bYj8UhJCeJ
 QWds4l8fCikh6VMpbFNDrTpBt0uwdMALzmYY51JkDqzh7un/mHK7QcsddW5GliAKlwAFEcpa2iP
 Mb5JbFyifLcY4xb1azw==
X-Proofpoint-GUID: MtH31KTxiauIhGX2KvGZuo9p7iO4AyqX
X-Authority-Analysis: v=2.4 cv=TIPQ2Fla c=1 sm=1 tr=0 ts=6ad9d711 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=OuD0wRZ8gfjUqNd7lbQA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220037


On 10/16/2026 2:15 PM, Konrad Dybcio wrote:
> On 10/16/26 7:20 AM, Abhinav Parihar wrote:
>> Context bank 9 is reserved for secure use cases and must not be exposed
>> as a FastRPC compute context bank for non-secure offloading.
> The lack of a platform name in the commit message and a split over that
> suggests this is a universal truth for all Qualcomm platforms, yet the
> patch only limits this to some of those who currently define a cb@9.
>
> Please make it more clear which one is intended.
Ack, patch v2 will have patch series including removal from all 
platforms having cb@9
>> Remove the compute-cb@9 nodes from the Lemans and Monaco device trees to
>> prevent clients from selecting a secure context bank for normal FastRPC
>> workloads.
>>
>> Secure use case support is not currently implemented upstream.
> Ordering this sentence before the previous paragraph would make the
> commit message read more naturally
>
> Konrad
Ack
