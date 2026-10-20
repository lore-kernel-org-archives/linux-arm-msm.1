Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792483581;
	b=4ommmnTb6RW4uX+O5hnJ3AQ6CzQuPCYhQlJp8oi2MSV2iX8agO4jGPVSmVMzpE2FNj/S
	 bFdgHMz4iSPOqz7s0heAvaEx/Dms5zWTWK7dNR1oygMe+IvE//1bFvyUNF33N8nt4o//d
	 gDgiIDk/e5B5TDBVY9sRzwr3yA2/GRC7vXd5WxKosH8Zo6BGUfE+pOwSRiL4smXRc0zjB
	 5idx/D/ewHbUvP1HTNYLxYNUbRdYf6thDkPt7ieDqjycrwpUm95ZOtoA2H7HTKGDpuiUz
	 hby6tFhPKNL8g1/ULBQQTXPVTXejLjfgMlX+nFB7iqU20N6Rbm4nmj9bh9kdOi56Xww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792483581;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3quIKETBo1ZjqvDKbvyOiH6uXLrpcCaWze7IG3F1fJ0=;
	b=eUvdsyOzWD5MPWNyl5gsddcVIQGb0ezoo7RNEs60yWNiI+kyQnsSCc3li8mpPMbPb+eu
	 uihS6eZu4r0rui9404FanrpDps2iJENfdvrr1YkeY964xeF4qPcGFFD9yQrAHCN3PU+Qe
	 xrNjK6P2XlmwN/ex2vzNuMzLszFdjavgM2kbVhgYnCITlvG2meBFWyR8cCw8VY01hU7rM
	 5G45KmSNdcIOXDzY4MhVP31Xt+K+Yl1nLnFQXZgadIvrgy02ZM4P4vZdTkI9Ff8VFYt78
	 1Q6EvTjwv9eMLT/q27L2gos/LeZnID1op+Jc5fX2mUwACWKCRCMvyWHr2vJ3xyaXrSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KpNb66Oq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VnQIK1jR;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B925C606A335
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 08:06:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B925C606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KpNb66Oq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VnQIK1jR
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tPGh1211286
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 08:06:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3quIKETBo1ZjqvDKbvyOiH6uXLrpcCaWze7IG3F1fJ0=; b=KpNb66Oq1aRXfUnE
	ROS4fb8H53uodsq4JHXsH/eQt9SR08bcFIM0qWPot3jle7phvh+stibRceQOEYUB
	jumdSuExfPIM+TgERy/96l1u3ZkTccnSFB0ND9tMbFIeNZhi9pnY5Dz+M6cD9vt8
	wgjUxwG9C826lZVkASOGAKQ8TxsjjUCKBUTS8WYx6P6UjH+yau6WGT7sR0MewrCQ
	rsAeOYCmP46aFZJR8kfO4XK2KKi+9XvYYTq6y9vJF592TuqDSUx+AJe94fqR2CSs
	PYuqDWna9t8k96/ExrWxtMIOIvR12yEIXh9uknEiD3JMVHDkc+gTW60DfvDMpB+g
	1yL6mQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5p1hew-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 08:06:19 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91c008df17fso2470286d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 01:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792483579; x=1793088379; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3quIKETBo1ZjqvDKbvyOiH6uXLrpcCaWze7IG3F1fJ0=;
        b=VnQIK1jRNi9zQdcfmcJJPM+DplJ0ODNgq2bOOomwHO7wjRDy0Fv4eeX6cM5lIwrkFD
         VD08HIkcZGHHZUjk7ADApUHOHTMro/ppSjNsht8+Qj2P0IIbwwk0gcdDst+FtJZMJ4xQ
         gZOdwl6xRh05od7dO0umTY9LL5lDGlI7aU7bsKBSkPb0zhq/iYshXoKSyEpDuFzLVeTT
         oizK9ygTxvXlh/VDJUllMMI5+KYO5bv8u95q8RazfsDL+knclSy2RMpfeTsWqbR7cBdy
         wTWblOnBa90bWmQqeOpW2binh5CoBV91/9MHBZaRohLjKB9MwhAeXXhylwSlnrbEBi+C
         vWNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792483579; x=1793088379;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3quIKETBo1ZjqvDKbvyOiH6uXLrpcCaWze7IG3F1fJ0=;
        b=c+N6JoLxeNgdkSLOx+4OM9GnsIiqWByNUOGiFTEhRiZEuqEpXVSGKaJ7qR20glHaa9
         TV9avHdexi80kgbryXMq6Y6vvWEDCaqzrqQL+BblY2GpMmqBXmqEvjDuB0VeRWkHvHjm
         ZWAn0jz01CL0fEkuHZdb/kkuondjivU/0htG/oIbWPIuI69PDljK0anY7+genX2TAeyM
         kAMIvwzZBTmD6AyYlSDwT+M76Mjiis7opECp4OJoFafULIMu7H4Hl5X4zpv66gXRUTsY
         EVG/PTZoOZAPjFAq16knkSz5UFRRqcYRdFOamujhiB/P8ejp/8BFjuWoxAC6KhQnfzhL
         AauA==
X-Gm-Message-State: AFq9FYK3gfVJIRxakIQ987guWJI92q54tFnPgBI6CZsYsQsTjR9EnpZ/
	yk4/kdAYBdbCvvcZdibqwgzFGegMLDbS7DCSxcMf0JvTtp+46MOqYLo05F3CfXGQ7hU6LhUzCBH
	ke49Un8GsldEluFghc97/g4EsPyDNaCUNPibloJ1Ht1wswvhNi/PnLLhN0M39tvHLML9nFgcZzb
	VH
X-Gm-Gg: AYBFou0prlXxOl+ybNKX5B4vZbPe7kUjfRSamdtxRw/dQ8M/trLjo9NfhfVuvsieABn
	xsrV17Rgr0KvwXa204Zc9N7/MsrrY5G16izrH57yZl+1l7To6sTGPgu5rM3UOSBzW3WH8pd60H3
	1a4WWpUTnMCs1hTQtBmfyFhcX+pQFw2bZ4KRxBMSuo8qdePVBH1Hqu4ubEib0k7SqxPNFVdbyDP
	f1dtiBDucG5Yg+qXamr6UQWPYOvlYeR8Mk9hvk4+r72P4CESHkhXxxfoflD30gU1SwPosd8TWUr
	rMHYqGCnw0g/mgL/lqfnVqWDXqgPPMUOnu9mn8QLmxJlgTs31Lr/nJ6ERoEl4deduoDhwW8ks54
	aYDey9LXX2JHGi0kPzdmD8Q==
X-Received: by 2002:ac8:540c:0:b0:534:f411:a5ab with SMTP id d75a77b69052e-53645ff6457mr127073591cf.4.1792483578899;
        Tue, 20 Oct 2026 01:06:18 -0700 (PDT)
X-Received: by 2002:ac8:540c:0:b0:534:f411:a5ab with SMTP id d75a77b69052e-53645ff6457mr127073391cf.4.1792483578436;
        Tue, 20 Oct 2026 01:06:18 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c466de84b94sm20989766b.65.2026.10.20.01.06.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 01:06:17 -0700 (PDT)
Message-ID: <d4957cd5-c546-46c2-81e0-b2afc14a4ea6@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 10:06:15 +0200
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
Subject: Re: [PATCH] remoteproc: qcom_q6v5_pas: Preserve shutdown error in
 qcom_pas_stop()
To: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260922-b4-q6v5_pas_stop_preserve_shutdown_error-v1-1-2adced730893@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260922-b4-q6v5_pas_stop_preserve_shutdown_error-v1-1-2adced730893@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: fiL4XX6D-tySwjPUuMqcCALgcXVAt-ub
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzMiBTYWx0ZWRfX7PmsRC8e5eq0
 ct3eFhYiyinYVwNoxA2i/S8myeCXfHTpaOfF+ssNumrM/Gqun3qLwuR2cQw3Eq4X+T17HvMrAJK
 hMQZOYu9wYMlPkA3O+Q1WnPgx61wBzw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzMiBTYWx0ZWRfXxcF2qJL8h8vF
 ZeBps5GpwI43QfKg3dWEOljwkIFyZqON+A20rouNneqN3Q8JISo/jk9HKZiC1anS5Vk19CZrbpw
 wpad61b1Rx02/QlELbdujWUQIU7BHrK/scKEpB98FYTNc+W3+//gUnSoQRPDCzp4ThVNIRgHexQ
 jZfViDFnY5tS7prFB12pfIquuC0LmR7cdr/xscUIKSUNbK8u1z3zJTSq6ltaieKMuIYMzNK4aIY
 s6A2AKyMs+eeR8E9NCxvDZ+FWs5DacRgXvzmlIXMDRPIUqzUYxjW3HMaAkDq6MB8/DALsSAQrda
 LDljxZVfndAFpN8+QqlWW84ZnUq8JArBC1NTERxk+E4Ojgy5VrqU/risvA/u6UE53Adne8GmvIN
 cAZ+EkGsXb3+xZft8R1nT3ovWdZpMhpn5IiYR4O6EqKKrR2u/lNEWRFEZi5pbzZQCSmZ55tjEQQ
 TQY8LXF6NTDbDPrM8qA==
X-Proofpoint-GUID: fiL4XX6D-tySwjPUuMqcCALgcXVAt-ub
X-Authority-Analysis: v=2.4 cv=crUOAF4i c=1 sm=1 tr=0 ts=6ad720fb cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=v8fyVrpRRJkhpEgro6wA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200032

On 9/21/26 9:33 PM, Anup Vishwakarma wrote:
> qcom_pas_stop() unconditionally overwrites ret with the return value of
> qcom_smem_bust_hwspin_lock_by_host(), discarding any earlier shutdown
> error from qcom_pas_shutdown(). If the primary shutdown fails but the
> hwspin_lock bust succeeds, the function returns 0, silently masking the
> failure from the remoteproc core.
> 
> Use a separate local variable for the hwspin_lock result and only update
> ret if it is currently 0, consistent with how the DTB shutdown error is
> already handled in the same function.
> 
> Fixes: 568b13b65078 ("remoteproc: qcom_q6v5_pas: Add hwspinlock bust on stop")
> Signed-off-by: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
