Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3FEE4AB3B4
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 18:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791917051; cv=none; b=rcQTvwXBtnRkXlPliqKVwX18nLCs43dqhkO/pyI2sLC5Nq/i+vXmKkElyfakNJQUYc6z5qbamU3QC1VOuApMn9kCQTcZhkuQYQGxfhkoOO5IG2a8GdnDs8EGvp5TBB4FgkecRh6VWQyiL8eKEM+lB17c8DGhPX6xlj+EPSDtrNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791917051; c=relaxed/simple;
	bh=kSGlsz4/kVX/O8qL2dH1ve++stecX3FGYtYzX2OQDNo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NN0/ShsuZApUgg/JCAtPiURoLpwKAYQ9K1S6m4GLeHnzZ4IODUNT+BkzgpQN1siv/qL874JyBTvDLFPQWtEZwpAfbUVnpkCZolV2J2hoYSv2uL3NuGYKlWgJa7EEQmYO6AVPNIRowKkM4bWPqg0ciY6K5nzIAIy8/fq1lZqE6nY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HxJc2XMJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C5BsGHmL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HxJc2XMJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C5BsGHmL"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DE3rYM1999292
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 18:44:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TAJ3OilOPOsiftZNwjsnJ+TIz9YE9dQrowEOurHsbB8=; b=HxJc2XMJwqPJDmQu
	OZRAgDrOy+Gs9DZy4hksAW9MZDS9tQo22XwOT3Qr9mc3uO64t07R+IvzFHzyNo/X
	JejiIwF70nvPy+UCYOiIO6e/+Se8cSxNet2oY4z6QwWSYAIDVyIn8GbiQqRR0OMh
	IRuGVxemsg/iVlDQprHHXdDAiYgvz97zu5RXQZLM+HV/9AeNXI4RIor/GAFUn0J5
	EtB+c9YAuldzJ+iR3ieek+tiliykDYoz+jhrXEMJIlEq6igpUewlycfOeh/STaTq
	Mkg/TyqjXkoApj+QlxfyWpHDGG53KGhilHMQdklMqXzXAbph5DsZSgziSh3fX+Nf
	XDPNOg==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9f62baa3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 18:44:08 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1665200f4c2so4600883c88.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 11:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791917048; x=1792521848; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TAJ3OilOPOsiftZNwjsnJ+TIz9YE9dQrowEOurHsbB8=;
        b=C5BsGHmL9/ffPGp+Ni04qDlY8Cw2h9ZgKNfA/5Y23P+X/hc9+3DHrRWjyfH9sFTK5D
         8LC+uoqOrSeWldYuoLRljHYUy6HozmU2HhVBKheaJh1r43t5Fc4WR/uVFq5PqARAFqoW
         aq8wKJF+yXzDezuk1k2AZhkrJi8OwJ7h0H4dabK7Sr2pV/loAHrc1v/H7irHq5gDyDzA
         SZIXNZ1ti6Tk7POC3x56drUhFSR0Av8sviVTQ4SJDiG0NQZG33GBcd+tm3bl3A8jQKnE
         YDtqiFJpAe75GY6WSiiteYbUtyv7BjR/ODN+L86UjYCrnXyKJtnoH8JIZKoEwC87UeGV
         mYqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791917048; x=1792521848;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TAJ3OilOPOsiftZNwjsnJ+TIz9YE9dQrowEOurHsbB8=;
        b=hHWmI6jIJVoZD0bDallAndDM8p56yyVY9Vl2GlCs7v/TpsLdCd9VcfmwSgCKu1b5bA
         RPqo7rlNMW2ITO5pcTtpmgJFEuW7wxRbsOut4DHa1x9dKFAP+/J4gQUhoPys1xJt+hQa
         2UzgkyJbJiVnc0Y0TfYJXaest1g2iSc7cC4YbXV8WKpRXR8pRMNlDBH2P4wnJdpH6/C9
         rXHCwFCrsYMn22+wTs8mUk6jWU+QghmXW/0db3JxLBFFJOhYMt7ClDLNAzv1l4ZF3DY6
         c63BmNZlXXf3WSylj9KLBLYYXnJ90/c72BNexkBwJf6WnXI/goDiVZEspegKdIslFDw6
         rAKA==
X-Forwarded-Encrypted: i=1; AKwUvBwIp00H+RWt+sHKi/EetkFT2aPZwIQvFA2IZWlqM8L0K0hC7Z24vg00nEr10sTJLneTkF6Zo8/BW+WJaB7E@vger.kernel.org
X-Gm-Message-State: AFq9FYJO5EkpvKmrxHvt33I9TgrVUSOi0DQ1wuIEqrlWcHIRJnevvLzc
	HjhTD5BcXz5yFcjL7TJVOxaS68tXlbIgP/hY8GWUN+ShtSsCF0jfHzROX+8AXf3RfQKTI6WWz5W
	Z2IyAVP2DmdFRtrM6VV5HNMy+YOsgPsdrXZ+iSHSs4pvlJh4/Q1OtRAcWmE4X8gn7lzHc
X-Gm-Gg: AYBFou3yqHSED8HRD3RGs3J8xaqRqFS948h6KzySrOkdzqPe9Ix755jh6CfvrreX+cE
	bMHgWuggDmMm9WyV5IrLY19oEXelYzRJFqyusPzrOkN3kCqF6xcqhMFYvPHBFmD7YhJR884Tbpe
	12yfNm3fb5m4sJOGl8RGno3IBiG5LipLRkmjV54fqJziIsPkqVtBz/gPHzoBlzGcaytgtP7ER6M
	jHslWEpOyQeeNaBagfzITaLaWIF4XQPBuR96l5u3YLcspzX9FAgYZN+/ocpyaihaTwzzusnFlvx
	Yj0z4oxYy8ITZesk69xmF2sFJ4AeDjczfN8gdyJTuPet31nNJqNC9LYr29Ydl0npKk+2QG73LqD
	lkQYTuYCfTDyzB40utf/eD8dcnva2ZYrAdy88aAK1tvvYFjB4uw==
X-Received: by 2002:a05:701b:4588:20b0:156:3684:96d4 with SMTP id a92af1059eb24-16a5cac06f7mr19510302c88.25.1791917047285;
        Tue, 13 Oct 2026 11:44:07 -0700 (PDT)
X-Received: by 2002:a05:701b:4588:20b0:156:3684:96d4 with SMTP id a92af1059eb24-16a5cac06f7mr19510270c88.25.1791917046694;
        Tue, 13 Oct 2026 11:44:06 -0700 (PDT)
Received: from [10.226.59.182] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-16997c21ff3sm40087467c88.2.2026.10.13.11.44.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 11:44:06 -0700 (PDT)
Message-ID: <1fc34b15-f762-4ae0-ab3b-735d750b7581@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 12:44:05 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Cancel Sahara read data work on removal
To: Myeonghun Pak <mhun512@gmail.com>, Oded Gabbay <ogabbay@kernel.org>
Cc: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Ijae Kim <ae878000@gmail.com>
References: <20260917192512.56205-1-mhun512@gmail.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20260917192512.56205-1-mhun512@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FOKOVOos c=1 sm=1 tr=0 ts=6ace7bf8 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=M-qdFEnyM_m4QQ1dQMsA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA3NCBTYWx0ZWRfX5Yemvha/kBCU
 bRpcu4QJmvPSmhL5WEsiAQePdLCIm3hVd/sYyqy7CmUZ4BIrmjM/U8y5Bnr4YYio+MHS6JRJywU
 TNu3S+cUDNEAYJaGy03r1zSB/G9vN8E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA3NCBTYWx0ZWRfX104VYYqtjgOx
 fHtIWhe05uKOaxwYD3166rrAPuMcEeRZX/GEEAdvkrTUwZ4zGzEl+YywvqerpQMzPqquVQwulMV
 YJHn+xLzmJe+6AIs0CCJKkDb47TnXZZ/uAsyJYN5sVVLIc1ckO5fOjotzXBxKRsGaLVBEVISfTB
 LXmVP1fXaDdhYEmrtS343qYvqjElFJN7YGU69/B18UrQTYQ1zMwC2u0L9IkmM5ziBrMNNlV5ZA0
 qWbFL9UI1+JTA2XHaCtzUGn+cD4OZ/lrc5vbduXePspZk/EhlCV8FWa1g91i+JuABRGXjI1YzbE
 2YTinIWqvfS1br1GeRWmPPSIpNZ16XuQJcJuhUJJSnU7PRPsP48LT5X29SPfU8ugK4wVVprLCAg
 4kOeJHM2jsN5i3vqyvHEMm78VPXejwuHvVosaGe7BQNBVoaJ7j1+TF2/+pkiF+8mzoWKEgLWCQr
 m0Hi9Q+LdJNrA+1MHJw==
X-Proofpoint-GUID: dlZtQQqTicokXKke8HtcrDz16lj5B9T1
X-Proofpoint-ORIG-GUID: dlZtQQqTicokXKke8HtcrDz16lj5B9T1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130074

On 9/17/2026 1:25 PM, Myeonghun Pak wrote:
> Sahara removal cancels fw_work and dump_work, but leaves read_data_work
> pending or running. The latter accesses the firmware and the device-managed
> context and transfer buffer, which are released during removal.
> 
> Cancel read_data_work after fw_work, which can schedule it, and before
> releasing the firmware. The MHI core suspends and resets the channels
> before invoking the driver's remove callback.
> 
> This issue was identified during our ongoing static-analysis research
> while reviewing kernel code. The same omission was also reported by the
> Sashiko bot while reviewing the Sahara relocation series.
> 
> Fixes: 7fb19ea1ec6a ("accel/qaic: Support the new READ_DATA implementation")
> Cc: stable@vger.kernel.org
> Link: https://lore.kernel.org/all/20260701105055.8D4371F00A3A@smtp.kernel.org/
> Assisted-by: LLM
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>

Pushed to drm-misc-next

-Jeff
