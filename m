Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793125453;
	b=0Luutlzq/Gc+PuBpDmttZduscKCH8oYKPl6el6QZD1L4V5ZCqSAdSKP8Gh/TPBpTScaH
	 CitJiKqLKk/C2EkVl7RaOuWDjPkuLHtqEV6Bdhwn6NMfTaKmKkkCOiQDaBjYF1aoB1E5+
	 B7UfMZBEJea3MArQ7AH3TJ2XU3bzo16LAMDynInoesfUOAiHNrN1xQSMVKtvICc1ftE7H
	 B962V4SRsTTK49fbZmYXDAOaqWLZTkge9cQyyImqZtwdNIJEYPy0o7vWu8EbO2gEZodQB
	 8ezu6v2yH7MIrknlpRWv9vgpMnBZQ3v5SgX7tL/u8OCEx8cABQwHWnh8vTPT9dRuflQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793125453;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=dKrXUpS5lY7XH1tqSJBOhITY7Qjt8wuebW/mqxCfCJ4=;
	b=XRvnzbgrs2h1wpwEpKZnEaTaat5OcVv3v5vNs8WLvXFsmkBSqd3zbLeBzg/CTGQB7//5
	 1MNKpwRYyGcOgiRlp628eJK8G4mGzNbUMH5SCiDhifganiDixtBr3NX2ImgynKN2XeTnA
	 urC9IdxNf/BSQJfO5i1KE4ubEQk7uNuBZoUgAhnCjr0YQ0Nw3SJsF5NpKvziXUAovuG9M
	 DSCxxho7xopuzGqHPfXDoAC3HHE3SrUe+2meMCPikrFBECuCPGzwh8fiFPxY4IaxO3z47
	 p4CIgezRJjlx3+l6wlojfHVfAwBm5nW2ff4oTksVajpzg4LhI9pv7K7ig3cAR9iXwUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BfzegT8l;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FPU2y1ei;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35FDE606A320
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 18:24:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35FDE606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BfzegT8l;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FPU2y1ei
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RIHUsK2451967
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 18:24:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dKrXUpS5lY7XH1tqSJBOhITY7Qjt8wuebW/mqxCfCJ4=; b=BfzegT8lQWr5KYmL
	8E/TvsxHhIK8H80cdTpoCVaePf+2gHjqNG3Vi9jpf9iObLVt0IN98de2RmDVZ1h4
	RxUHXeoq9nRKe8pBISqgkpooJGde9zmxZV1UiWcMzR7tLQS+B+XV//nNKXkG4sHG
	zUDmMhizlQupnOG74fSRoY76e5kSx2WSz9pSR3oUUjErJwGUd2rzrQlgN0wQfMdt
	lLtwjmUp2rS94XAEAQY9RCt7ZE015xpmDOMWV/CSWSOHGq9MMFrzP4hPSXSQzpw5
	dyHgJDRtBGlXkPyLZmiD1G3022BvJT9jhunlS9TJXsq0yD3XTr3IKJwXMEnHauI0
	f1ejuw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjy6g0m4s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 18:24:11 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3662e7a9299so484085eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793125451; x=1793730251; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dKrXUpS5lY7XH1tqSJBOhITY7Qjt8wuebW/mqxCfCJ4=;
        b=FPU2y1eijUijHyfp9tjH+qmGD2sndkRgLwYXoPC8bTl03l+PaSXfz3w2PgZZsxS9BY
         U7YaOmpUKfzhiCUok+nBtgRfmTyq8RwJhY1Gd1VLEnU3m+1tMlafSDytFTu9fs3KFEpg
         5Bb/y863smfghlwLVqAmH/N9YT/7dWBcVj3mHAtliK6EJ7psWR5X8872Tsnvi6JN01Pj
         IqGY27Qt9zHo2Z4GJApzBFuUmAUXhSzkKxMw4qrgq0h7gPzDTsjTx7hcMouA8Le/rtw0
         sMRaWUA1jV9Yrzg9raBECO2ScfEamQ6e6h/WNYwA3Ny4/irAwITOu/4uUsy01nIzG7Tz
         /YQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793125451; x=1793730251;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dKrXUpS5lY7XH1tqSJBOhITY7Qjt8wuebW/mqxCfCJ4=;
        b=g49TIkUKpZ+Ujafc4NNn0Iyc5/QzOi8Lv+apSPWyKbAAJLj41YgE9k/lhrVO/fCE3u
         UiKmW4ZUEhgVV38LlyrYL7JyQowrbOu7JVFyPnLD0CRsL6ddyflNJmjjGgRKuS7JIyJq
         q57IQYgk18C8/mbSy7ctJlFh23oXw4kuTLMwsteKpnNzhi3h7bd/1iaMbE7nDcIYuwsp
         S/F1Vb8QCjeSO1DmI9RGxDMc+I7/DtbGvO3Qaa1aZkKE6YH368z3E/7FC4rlMO1pBeuf
         SYZXlYGbjTdZQLzf7hbvHE8qn1a/9cy5EPrqgw+EMxx1bihrhCwjyWZvK2E4MY9FYp2y
         OgQw==
X-Gm-Message-State: AFq9FYLMP14afZyqNKSwTlCVxNMGz72qEEKZeLzmLbZ8DUy96Z3zeunI
	HtpN5fqGcJs2E3J4CvKl/i7NJJ3IQBVIBh94ImObLnGClJOHbYwr32ZmfRE6ANwIfcQrcuJRWek
	LIvQ3P9JtyeMUDghYpjMTJc5Gfzn75Q5p9WRNHpyw17BySR2piFbvjHTgJ1GlPqLzGOLh4+KmO2
	PP
X-Gm-Gg: AYBFou1odZgR4V1gcYFSzBYHly8yuylfnydYRM+6moNjsZPCaIUryFOr35KW9oObKWI
	xElUVwag9mnvGBXYLNEfmN6ASyUlQsJS07EV9IasnZU6oJ7Rr3+2U97R2COwM8Uh/ANGHD8rxUW
	ay6qn5ASXN+pPPG3xqoDHcKzlTIZGRg19jaS8EwiKBrX/ioe4Ljb6H4vO7eYf4OHwrFeuIAf4zd
	owhHCxkpZH/7pQ8rHH9xayzEHW9wcBYvBJqCKV0/QOQFeyJswn4HtRUjIukuB1LQ038zA11tI1D
	zI12SBGQke35zBFCuJfPGu/o8bISg9WKc2EzMJspSCvdhSm2mi1BTgxOEqL4SO/6epIKXk2UvZK
	FTPG6pHRGLbRRW4VC2BbPVDTFUU8=
X-Received: by 2002:a05:701b:4349:b0:194:3a84:e67a with SMTP id a92af1059eb24-1a6ce2fec9fmr43956c88.41.1793125450543;
        Tue, 27 Oct 2026 11:24:10 -0700 (PDT)
X-Received: by 2002:a05:701b:4349:b0:194:3a84:e67a with SMTP id a92af1059eb24-1a6ce2fec9fmr43925c88.41.1793125449897;
        Tue, 27 Oct 2026 11:24:09 -0700 (PDT)
Received: from [192.168.0.195] ([124.123.196.2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a32ff780sm34006142c88.22.2026.10.27.11.24.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 11:24:08 -0700 (PDT)
Message-ID: <d0492d0f-42a5-4400-80d0-987086d7d224@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 23:54:03 +0530
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
Subject: Re: [PATCH] clk: qcom: rcg2: validate frequency table entry in
 __clk_rcg2_shared_set_rate()
To: Gabor Juhos <j4g8y7@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261027-rcg2-avoid-null-ptr-deref-v1-1-43c21b54cfeb@gmail.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20261027-rcg2-avoid-null-ptr-deref-v1-1-43c21b54cfeb@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA3MyBTYWx0ZWRfX3AY8BtQD91jp
 HbV3isN0mD6D3q1wux4hrBO7ovKqFLT0/C5YtpMNOX+BPBi9ccGoU6PqbBGEGE3qle6uHlx+DA4
 0jEn6wv3cv2udt7/xJitQvqEfQvCUR13J20z1RLPze4ezyd4aBAtu1+YdeQfpj+1Xl7ZtVkGnEf
 1cnXRQrAE3W1Sp3uGp3uM9bRAXCpFv1zv/hwJV9qKp73GxGLapTWKKFcizhDyjctJoQEUBmPsm7
 /WQNT4KYf6LBExniaEEYzlyGIOTYabIthEtFxIe2lUO7ShtR6UigbMbn07lJdAv0rrVHO/Zuks+
 f2iK/bpRFPt4AfmNd/m2XFLFBC+4Afe9ECZDQyQQ71GfMa+HtpJP/2iDatctN9tMyKslTd3WOHU
 +9a9WH3fUM3EXF8nJ3lAXLeIGfpfrhr9numdNxe/Shs6cMgeUaObGEwRX+s3oIeMYw3viIYit9P
 DcfI8FK4b09erMBX3LA==
X-Proofpoint-GUID: mfpHXeC01khhqXTS8hW8SYynDC5ye7Fy
X-Proofpoint-ORIG-GUID: mfpHXeC01khhqXTS8hW8SYynDC5ye7Fy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA3MyBTYWx0ZWRfX5i79Mqzq8H5f
 LYSYuZWCrXSZtW+3qA+MmLZohDQtezOtfDlSRyFwcG4fomNXlfaoLPiKQ98jHYoSWxbKAUrqrgv
 VtLrk+itHETpP4u6KYRAMWiD/z59Rkw=
X-Authority-Analysis: v=2.4 cv=dKgzC+Zb c=1 sm=1 tr=0 ts=6ae0ec4b cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=QnKtIixuteL6j6IxG7zQig==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=i0tAhZrUCOUqKSMIGdwA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270073



On 10/27/2026 11:35 PM, Gabor Juhos wrote:
> Commit aec8c0e28ce4 ("clk: qcom: rcg2: add clk_rcg2_shared_floor_ops")
> removed validating of the frequency table entry pointer returned by the
> qcom_find_freq() or the qcom_find_freq_floor() functions.
> 
> Since both functions can return NULL and the pointer is passed directly
> to the __clk_rcg2_configure() function where it gets dereferenced
> unconditionally, it could cause a panic.
> 
> Restore the sanity check removed by the mentioned commit in order to avoid
> a possible NULL pointer dereference.
> 
> Compile tested only.
> 
> Fixes: aec8c0e28ce4 ("clk: qcom: rcg2: add clk_rcg2_shared_floor_ops")
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> ---
>  drivers/clk/qcom/clk-rcg2.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
> index d7914e59129f..260e90f53461 100644
> --- a/drivers/clk/qcom/clk-rcg2.c
> +++ b/drivers/clk/qcom/clk-rcg2.c
> @@ -1385,6 +1385,9 @@ static int __clk_rcg2_shared_set_rate(struct clk_hw *hw, unsigned long rate,
>  		return -EINVAL;
>  	}
>  
> +	if (!f)
> +		return -EINVAL;
> +

Normally, the CCF calls .determine_rate before .set_rate. The floor
determination helper already rejects a request below the lowest supported
 frequency:

 ```c
   if (!f)
      return -EINVAL;
 ```

So an ordinary clk_set_rate() request below the table minimum should
fail during rate determination and typically not reach
 __clk_rcg2_shared_set_rate().


-- 
Thanks,
Taniya Das

