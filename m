Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE6F93803F9
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 20:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785358375; cv=none; b=dzAFhmFU/3bI9odruJ6Z8RG+YcobhhXSCq1fH6BHSrNk9X0gQ9QRJjDGmhFq7rOXBAK7VvLYOyBl7qTHv4WipFAPkCwFe7hFaUiwyMjBfagwVwDFw2MR0eaCVw9FdvzZaSqaZGYKOQfC3qhB6aqhBC4yASIm486668pQ0qlAFo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785358375; c=relaxed/simple;
	bh=vD/s6wza0g9D+mKcX5bzPQ93KpB79g9VydwRgG15eM8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jfb0tv/QhD8vm17v0bjYFG7HepYjdBW2qrt4Lv++00agvFetXI2lYdXo4EgcY80b9ZZNjL2dHKASqIxLPvpG6gePkpceOB5h2i1bniJN28aAGXsQBvhmyXvRXliR25BZUtYLED4/obYo0FEVVb+H8g9+kTj//jhFJew8nXxwOyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Od9m5I16; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XcoHCiF7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Od9m5I16";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XcoHCiF7"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TKVqfJ3103208
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 20:52:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	critbA2mnXZKO3iDwpU36SfNN90IioeFvggdcTePRqw=; b=Od9m5I16gMZP8va2
	BWOWBBeX1lTjGgULKVTorUrJorHn+qPo+FYF/S/1+i/dj2Bbo3tWt25xVkxNL0o1
	gDNqIeP4VbGOCiKkIe/PGHJx1G8XZYA//FnSTyWc/9hpJ5suiuURaW8t/EFBz9EW
	w7V8a2qhpB1UzwDPwENGla9fbqNUEK35VxharlBmcjLXQv5NQvXJ5l4A4zeLopJf
	dW52PZKEBORHRQZzF7mzyqrus3HGeMVrFU+nQeF813oWza/bQlF8NmTx61Qvnyll
	KCjCG02TeBTe8L2UIF3p2gW30KuAFWeRywK4jzIWCf1ZYCqtLcxGiN2Nt71Yi41p
	KfH8Nw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqrmvg22v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 20:52:54 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-848662cd2a1so1567277b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 13:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785358373; x=1785963173; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=critbA2mnXZKO3iDwpU36SfNN90IioeFvggdcTePRqw=;
        b=XcoHCiF7OBgmlL0nJ7cJDk/ST+JSi2i8mCxtoanw9U/gpZ9KmcergOiSICKwWd4DLo
         8IwZVcTxkbpjiNfd1tSbCPlQnZvUonYthBAVX9YtUUO5ryJ40sQrv5Zma/PDUwlCfdrh
         vi6zzEf3dEAdD6NcnEHyeNVnU4VMeu7vUwTFyOdX8vXl9WDw/sGCOyejjR3P7IrmFHlk
         qTIoUoijFpXm2cUA0aWt0wg/YFNEIX5y52NCLrttEnmvCXUcvQXAqlslHIYsDq9R5DbD
         nPCHUSuzLu88nbp0OotcJSklp3XG1z7fsL8FVJoNQjasPmEBhcDbdBhoFeCYAXcwwxK5
         +4OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785358373; x=1785963173;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=critbA2mnXZKO3iDwpU36SfNN90IioeFvggdcTePRqw=;
        b=GpN4QxiujyDNF30B2bS52NOfRNu3JfPH7P7fJPeno2t7F8FU6bwqlyzQymgajpaooM
         FfHfxg7N9ycGyeqIsleVnVX2ZZqyHo9phtsJpOKpf7rP+3NuX+X4/4O5xNEcD69/ZwuC
         OYzfx17wzTI0TCiSu9PKUTY0KnMdwOelJ9LsJ0W2rslVyG9iEooeFcyITJZGTi6Pj0Cz
         8MnXkVhOAUP+5Quk7XyDw/FqtXM4aEGBQLrWkK+2IX6iXyFkzLzAbnETFKD28OxfXNPD
         p2pHEc1xXAh4GXUiR30JzXsN0y6uJyW+Yb0w2lLLDm1WvauAQD8NWnA+UXtBlAo0fPxu
         cfLA==
X-Forwarded-Encrypted: i=1; AHgh+RpMiQKsvSaBiSXJFmW7xXYVJh0K2/8xYvFihnINTnwXQBBUuayxPHXzKhwZ1r0gkF8G60fOIbiYLe1iQYx5@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8J6KujbWpTF+Mca9KFbltlTtY924rrTXGYux3s0j1GgeQgmN7
	qtSEl+0DRdAeHnpA4zhxwYlAvI/Vo4s+Hfbl0nw3BtX5g2v2Gkr7S/WAOdP/SbvrLjLtx6uyN26
	yz7kxjkbHAqv/dBUOQO5IueuHkQvbumDKTsVErAsWSq6T9s4GTG3jzOT7Zsope8ubm7Hb
X-Gm-Gg: AR+sD11Vu4bXN+nG43LeojHnUZLtt2NVu2Itj3npEJziQBX6FsvgAIEEyWaQ8LlnHsO
	PgLppwZdd2Cm7T4dseO4rp78Ayv+qxz/1qMQtSW/lFuyfD7+7nw40GUw4jclAr6XSbPnGo83zve
	knsUzBjQceCydG8SAxmfnBH3U5UU5Wl079rru3qcIzx9dPDrik7++Mq/SRad194NA+/cC+LQlRr
	8HnpvkEHzCcA8G+2KSox94/Pckz90/UgaC9YgGfMunIMaEu34uAd/iSQlZYm10Cn+8A6AixUbfs
	ca20n09zyk9is6YLuIgE7dLIkHko6VpfGaWumRc5PLGGs+cXjZzMyAlobywKRzE+NzsiDkqEdSX
	yUSeEBJCQOiTTCcyCLhn8D1nElNmiatdRPR5Z7/R1S5vz+YBff5kHTQ==
X-Received: by 2002:a05:6a20:6a0e:b0:3c3:6544:6083 with SMTP id adf61e73a8af0-3c89cadcdbbmr9304003637.0.1785358373345;
        Wed, 29 Jul 2026 13:52:53 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a0e:b0:3c3:6544:6083 with SMTP id adf61e73a8af0-3c89cadcdbbmr9303973637.0.1785358372886;
        Wed, 29 Jul 2026 13:52:52 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504b10cdcsm13512172eec.3.2026.07.29.13.52.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 13:52:52 -0700 (PDT)
Message-ID: <187d7b00-748c-4056-aec6-b498044fe1c7@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 14:52:50 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: use sizeof(*trans_hdr) for transaction length
 check
To: Muhammad Bilal <meatuni001@gmail.com>
Cc: carl.vanderlip@oss.qualcomm.com, ogabbay@kernel.org,
        dan.carpenter@linaro.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260617212520.59801-1-meatuni001@gmail.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20260617212520.59801-1-meatuni001@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDE1OCBTYWx0ZWRfXyKSfTOWxv0dF
 fiq8rwv5yinIAqYX+82JbBZl6buyCe0BxeIVI+28/hgaBL1J94v+0DQ+hMJpA5L5tZu+GEwyWoS
 6BRt8Gum2xEv5SCDhejubgpxohNpo5A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDE1OCBTYWx0ZWRfX+Lll+Z8IoX27
 8m3idC58F0ct6myMA1CvluD84I2AWYTsgHV4ViXCpdG3roYYC36wVdK/y96ljcDgVhuMAOmipMy
 O+N42TIJLANmVtuMLs5xHv6DO/xabjzmsusGxR0Bv9/7yRs+k0Y/xWfdP8rx0jgikU5dZjcrLEQ
 edRBd/DIw/PI68PCDtf0BXWUgJaqBz8WZnVPZt5XE1elH594Gngv33s5fjRPFlf5Uvpq6MwU5oL
 6KthjPm1C9lowIifrR3SGJkiHnpZm90oueXYnyap5K3bNNmUordcI2Q8SblrZ6g681oKoOikzN+
 e12VPzbI6BBlMt+qeBHcTmNWL7tES9hL28QOnb6ZL78pE7FL1OwpGI3lrLjjauISj+J3B3ApDXl
 sjI9bYxIHyezVjjetQZh9DPR3UEnH/OznoAC6ltqNJ+XBQF+vK7/L9ZYpBycg2kALeufcaTI3XO
 4F+fQWF1vzrhonZSy/w==
X-Authority-Analysis: v=2.4 cv=K8AS2SWI c=1 sm=1 tr=0 ts=6a6a6826 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=GD8_rapH8p4utXL01xcA:9 a=QEXdDO2ut3YA:10
 a=zgiPjhLxNE0A:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: 7rdW9f_Um-4sU7Wbzx2mROhiGUHr8q3J
X-Proofpoint-ORIG-GUID: 7rdW9f_Um-4sU7Wbzx2mROhiGUHr8q3J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_07,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 impostorscore=0 malwarescore=0 adultscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290158

On 6/17/2026 3:25 PM, Muhammad Bilal wrote:
> In encode_message() the per-transaction lower-bound check compares
> trans_hdr->len against sizeof(trans_hdr), i.e. the size of the pointer,
> instead of sizeof(*trans_hdr), the size of struct qaic_manage_trans_hdr.
> 
> Every other length check in this file (encode_message() at the loop
> guard, decode_message(), etc.) correctly uses sizeof(*trans_hdr), so
> this is an inconsistency. On 64-bit builds the pointer and the struct
> are both 8 bytes, so the check is correct by coincidence and there is
> no behavioural change. On 32-bit builds the pointer is 4 bytes, which
> weakens the minimum-length check below the 8-byte header size.
> 
> Use sizeof(*trans_hdr) so the check validates against the actual
> transaction header size on all builds.
> 
> Fixes: ea33cb6fc278 ("accel/qaic: tighten bounds checking in encode_message()")
> Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
