Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793868895;
	b=ElYb60JkmcgF8IbCC4Q2Up/io8W3tkiLOQPE38s89jcRwTsYyRCA0uwb7LXpC3QFxciI
	 byjQdS9OAhmy3unOLIODIDFrMwfJvc28oKWxOgAk1PK6Yf5xspP3fhThWT698RjbjOSMQ
	 fZoqp+5PYYH6NuT6fnMzn5wV6tuBN+9EIHaR+voSMgEHPqI/1TEjqqhKBm4CGL9p5DB2A
	 xLErFqZWJxksZANGO0QJgAg2fb+JxHwsKbaDpBPPr7+BZz5uJR+sHmIF0rARr444kWGCb
	 P9/2+ekYJgFpQYzSoWjp4NpFllRxc/2khfOIVlHZmyXNM8acU/fAWhA7codWi7zeF6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793868895;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=kO+uPMdDpz8W5t/f37PmqHD6B/Gio3Vy2iMQmXxJUgI=;
	b=hWMbJdOmc+3oYWU/hZLUqDkEZNd9vMyoA/ki8LubfMEJSatCtvNXG7zLVOM8PER8ZCq2
	 ZsVyetacYO/K48Ix+P8idQJEFV+QupPJPNzgmqn7tPfk+usQdjKv4OzD8cFKUJwjo2VE/
	 PatqjjoiC36aawDhrEFppiLUen2Qoc+BsdHxkAaPJiMyd8CB/r4zoCmYq6CGZ95R6FZxJ
	 Oc83XESsWpTI/rtwmRwMpNgA1aB/jVTz+g3C/7X1mrSj5GlaI36vsfwzNpxVkM1qz9EqR
	 jUhISQqXAM9ss465sXSLzhrIPDuaat4zMQ7I3Kve8Fqzksbj6cknODuS9wKy+736nNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QjN1lQM2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fJS3lh07;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79184606A32D
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 08:54:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79184606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QjN1lQM2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fJS3lh07
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A56UFQ13074135
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 08:54:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kO+uPMdDpz8W5t/f37PmqHD6
	B/Gio3Vy2iMQmXxJUgI=; b=QjN1lQM2lBm74tGA6J8kZzfAbK58hzzqHrUuUJES
	zoJacckMYEzHW4ZtwZEl4s0Nq55KdU8lOEiBIOyqPgVoDGsQY9dRCJsXhshVhsQb
	g8Ix21CdLKg+ebKq6KCoA65a7BOqy5QFdK00RG9BpFWYziliPuRK8aI+0gBGNUQT
	LRitOMu1tqg1JRbSA3pCpXrftXbHpCGwg781gWafpKEznqoWmHwYsOxUBXmwhnFE
	s7FRPQqcd7KcGywUrgyV5uWQIhI81cxvR2yvmwhXKslYzNbNeR8KjDyV7SZpiPNi
	1rgGdyorUHmNtw33+ri7J9PxyEzaLm9qeLAcuXcTd8EQ3w==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrksq8ry8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 08:54:53 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5eac2cf3905so430133e0c.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 00:54:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793868893; x=1794473693; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kO+uPMdDpz8W5t/f37PmqHD6B/Gio3Vy2iMQmXxJUgI=;
        b=fJS3lh07mwOOdRIf5arM/QvbuGRl5vPJsdmldR/nODTH9CgeuUds6Pw8LSsv0pxp8P
         R7RrhRHUF3MCGDUsN6hl0Z2Qde5ycl9HtxMSciOH/xehUbJRAllwYJodab1xDEr+7BCD
         qTnuxZJx9Tjk6k5TF374hvjw9uZjWU+OsrAb0pbK/oz9As93le60BCoLaIo+9g1HPUFk
         utN4OH5bMtuDHqhqg8Gs+Nj7lnI1cVOkSd4+PUkPDrLNRlzwiIBH1QzUPpgFP816R129
         ZHAqHTskGRQv55DYpCuue45pNhmTIeOxbv8lqHd7msJo5smlBMEWZitxzQiwz0iIjzCm
         OK7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793868893; x=1794473693;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kO+uPMdDpz8W5t/f37PmqHD6B/Gio3Vy2iMQmXxJUgI=;
        b=Q292i7X524oGN83A+YfP7ljt9KaszIcR5FjZBLvj57beAepS/yuvix5MXtpzQjhvTT
         8HiFUvAUpEgOjMj/hf59JFPH4RxSP6BOB0Ni7Q1utRvNp05BRIW1c1QtcU1LlSg/FWCi
         rqtkIh3UD+UUQVuTBZAQepJBogCVVVeICaBlDzJHm9WcUUCXgRUbLRHxxkTAuiV7mH5a
         KUFHv6RVNV+v3xMBcplNu0dnYuTuBUgRT4XLxswZeCbDe3uEaClejD0QMXDEMRwIKNAz
         CKUvTU+OBpc1anvgIP2i40QzVBD8S5Usz5hLAYKWCbXZ8imIs0dyTVVRDUVIHw4rlu30
         Naxw==
X-Forwarded-Encrypted: i=1; AKwUvBxUW8v8WOns9CwuEr6zizQKnJipjsGH0x1YSdXB13AgRlYvfllVQKcHztXmaHfi1+FJqfGOMG47upURtEF2@vger.kernel.org
X-Gm-Message-State: APuU4Z+k0P6TewMj9ia+9QmLWshFWH7SkrVuT8rsfJ9cSIKk+94kWevy
	Yhw2YZenKOdmX7EiAqaU7Cx0BSHO6MRN+d1FxbErPN36wLOACihIj519vMHXSJdNOxhEkO6Qpny
	OfXvl9heB5vkwrZYcWEvGCVbmfkXtu21PZHKGKKhQ9PhMx0b5WhXeZKnXWgJzOVytIask
X-Gm-Gg: AYBFou3UKoCq7YgEBUZ+URLBjyPSe8YtjfAsaAgKZd8Iz7jjIUH+y0sTItrW1DHoOaX
	qvN1UWyNB81qmNvti2cOtHh1NE+nGvk6vRNZeYM8Wt4jdJ/5BYo8mtnC1OlI+gBLM/mjCsH/z0U
	WwZCyWcLdfWI3Iq9cP/6Xm5G7mz2KBqN4NalvBljeqkkhxSMk5H7IkYvjbxGuDNXoZSRPB9/Tep
	TcJiKVpHAChTDqNTcjXU6V8W4SFTe0vxgxzPikoLzTf0q0iC6BqNrCihda8JqonzStBxhUDSuK2
	UEow8GOvIcJqSuqLF6WehjJ9ehkZ+t7cNxwngJ8QkL3H6/oQNVhNvUB+ek7nN48J1C/fxZ0G0SO
	HJaNTKM+/U/cGYHwfo/to4yYLDfEkVwo4IqPt81QuIaNVOne6i1P6sqc/Wk3LAzg=
X-Received: by 2002:a05:6102:5811:b0:7c5:4da3:aefd with SMTP id ada2fe7eead31-7d072c25cf0mr8060502137.15.1793868892502;
        Thu, 05 Nov 2026 00:54:52 -0800 (PST)
X-Received: by 2002:a05:6102:5811:b0:7c5:4da3:aefd with SMTP id ada2fe7eead31-7d072c25cf0mr8060491137.15.1793868891889;
        Thu, 05 Nov 2026 00:54:51 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed552afcsm8675487f8f.41.2026.11.05.00.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 00:54:50 -0800 (PST)
Date: Thu, 5 Nov 2026 10:54:49 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Haotian Zhang <vulab@iscas.ac.cn>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: cmd-db: Fix probe race with possible ERR_PTR
 dereference
Message-ID: <znleorpqv6fey4tlkwzemxhqwxy7jz5lb4xoy5jhbfxqovjtpc@ueapczda74lp>
References: <20261104151550.215604-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104151550.215604-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzNSBTYWx0ZWRfX75jd+s8uh7Ua
 B0dUOTQORy9r8iPSivTCU2kkWIOVzGEaHoKFVvo/KtMm/GHBOX7mjS2OOWhFDuHwqsIn0Gugn10
 dKPO4oZwM3s4Z1bztMN+1MymZ8/hmeUjg+OYOSV+tq4wLOyrItxCgI+Kjmc2Rn+sRvHDsZ9F0WO
 9MXgQjVXnx6gbXxS1OZggF5vHA6R7aP8jQwvhbtjRTSjc9YcbsM0rz+Y8w5MOh8VJEUoikGXMoj
 iKFOwubkamgLCjQ7NK0hupgQf8eP6jgPS/Nud7DV5P5kKnqNMSLgkl5biaL/HJb0jP3EnrUb7EV
 sExIR3ybcKAXIFO9d985v4xq58Gb8C/LsZibqVDjra1Hz+q6hMbzP+AwAE3CGvKpgTF9Y8yhEf4
 anktakM27ngOAY4PSz0vz+Zvqi5AlQVDNnwwyDMFe++xmjxKPwe3fWgdxSFIBVRwYcftftwu9kZ
 W4y8OYyFXtmzk8Fg6EA==
X-Proofpoint-ORIG-GUID: Y12jijFC9NrM-oARd9Za01USoqkrqpO3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzNSBTYWx0ZWRfX5fD45X1tiFPU
 eBlrVoCvNFPDZrlslLfW5C7z+rF1EXUzwryC5iyIRqR0jPkrOlzRGLFC5/pUT1YpRbrQBKN0q55
 HmpjSHs48t3/l2uNcLGfHVbg6w4OT3k=
X-Authority-Analysis: v=2.4 cv=CIe/zhrD c=1 sm=1 tr=0 ts=6aec445d cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=VtB4zeJ1tuDDAJRGO14A:9
 a=CjuIK1q_8ugA:10 a=XD7yVLdPMpWraOa8Un9W:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-GUID: Y12jijFC9NrM-oARd9Za01USoqkrqpO3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050035

On 26-11-04 16:15:51, Krzysztof Kozlowski wrote:
> cmd_db_dev_probe() stores the result of devm_memremap() directly in the
> global "cmd_db_header" variable and only afterwards validates it, which
> opens a very short window where a concurrent thread could access and
> dereference stored ERR_PTR.
> 
> Theoretical (not reproduced) race condition could look like:
> 
>   CPU 0                               CPU 1
>   -----                               -----
>   cmd_db_dev_probe()
>     cmd_db_header = devm_memremap();
>     // holds ERR_PTR
>                                       cmd_db_ready()
>                                         if (cmd_db_header == NULL)
>                                           // false, proceeds
>                                         cmd_db_magic_matches(cmd_db_header);
>                                           // oops on ERR_PTR
>     if (IS_ERR(cmd_db_header))
>       cmd_db_header = NULL;
> 
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/bug/linux-1e6d9e1c-b97d-447c-9cbc-d874a0609918
> Fixes: 0da7824734d8 ("soc: qcom: cmd-db: Use devm_memremap() to fix memory leak in cmd_db_dev_probe")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
