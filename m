Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793016122;
	b=P5BYDg+csBuW4RRgeddkBtFfdT/lcoaHMypyfM1n4lWUmR8JsrrQpZs0ybJRRuxgYPTV
	 kjTQO/7Urlzp7fh8UUv9ZKiEG/Zdxqb4qtVQrtyPjSETVrvwG9QyMTDdYACQpUBRmELNI
	 VELInXrKpj8GTyhsPIo+gHg8DYZecvHHoT2qck2PjWDJQHnVBapdh6t2eCkYuNycVY2pg
	 kFYilifq7lDOgGnB9gyyKdFR2qiRrUJGMW5UnNeL/N8lxzflTaXyPIkEvEEIw4JiO2PV+
	 3m9862+P00ZqhyYGqdqMJ+hu+GciHFoYVQNBedewewLS1w6MYxy1r+qiRjOHgAF3w6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793016122;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6FwZpsfmJUNZUlkHboNK+aqwI7PKWRJo811Bw9yHhN0=;
	b=VZUQIJNrD4pFJxUVPMZOQ5KiF4lSPuOO88B+AlxaJKmW3hGm9HXESmesgruOgF7ztCJn
	 0dny68MEtQilUaFZpvsfIKpCftQPMBgDyBS0bv/RLMUltMD+SujLRFX+zLvB/TweUo4qv
	 xmQk7FQcYgi7zYGShc36Up2cYC5TcuO7qziZBG2q0uXeJjTA9q5KG+SdnD9Ud/Djidl9p
	 qH3xFKTQpurXE3BzQO7Ypz4a9e13lF+lhfLSFSxPGReU+hfFz4PPv6kwiUQ6/JyjauhXd
	 YsbS6SAq5dJFph5eIm8PUPikRclOhzPfYDTo7V/aFZyRMs6cjCSIr8Gk5tEPfyTKyVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ItEGc5uu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LIQH15v3;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE04660A3812
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 12:02:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE04660A3812
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ItEGc5uu;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LIQH15v3
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtNt53050888
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 12:02:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6FwZpsfmJUNZUlkHboNK+aqwI7PKWRJo811Bw9yHhN0=; b=ItEGc5uuZEPb/KGb
	EhHnE2Ni0IRkipvHjLuYd7Vrs9LtGXnJrR9MqECWpw6mjRrLbsGnFVwTJyque5Vf
	g1wCRxRhQhN3/Mgy/qJ2ozw73hvf30vdn3Zgz1zsRPKMnP3A+gfrKBRxjr/sFrs1
	1JR8zxvQOi123lmZdwm7kuNZu5I864qfTK58c+m3ShwcsH+QQpQ4DUcIJuuQUnwM
	sEdh7zoTvXgntul9ja69eZVwMSrOFqrElCp87JeKYctt8TgOXSxWVaDEX5Lax/uH
	cY6J5FIbc0qRTQuxVoq6D+CdSCfCl8+3GswbcrthaA25f/A57Rsbk5z4rjeZoPe3
	hG4+fw==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhvdda06p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 12:02:00 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-988b530df14so84658241.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 05:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793016120; x=1793620920; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6FwZpsfmJUNZUlkHboNK+aqwI7PKWRJo811Bw9yHhN0=;
        b=LIQH15v3gM7wnCbVuhLVvmkHBlxEBL8Wl2KWzZYK/KrKL2MOysHv7nwT688z9OmWXr
         +buc1oiHLmEBeFmpclkRVNkZmnQc6YGlrhxKRz4rCcsiYxtP3TdV8HG6YPTNQ7rEY9di
         F/4kICOMTUH93oqv/Wm7EYk3Q9FWVfdvBus2j9q/fcMRjIP3RRP3hyvlSWKsPcERvxBX
         Arf0aBY+rU9o07TSN4AFasGJQnYDXygoVUrb3gnHxv/zGNfzRnDGLgvCX5Zvy8peSGg3
         iMG4KxSckfm1hno//H3VEc5pbyFgNbDW5oyq3BKQhjS8k80E8EUVlg86SsBfFEs5qgQn
         m7tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793016120; x=1793620920;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6FwZpsfmJUNZUlkHboNK+aqwI7PKWRJo811Bw9yHhN0=;
        b=nh4XC09Q0b60KtHRDieyN+S9E+2QNfLERXXFau3BP3YQYOK4oP+98hF/D1UWkZbVFp
         e5do4yB1NIm5Pqc5NAJT0WNwZNnzDWAQELndVeUmODhiX1+3LSWZs8fefrFfjNUqeBNR
         kHG5gDZDJFzBGbe2vV10ZCWmUT3wU/ZJlgtEaFIA48AWHkpAttjsRS94Iq3uHfSU+M3D
         YcqyOV+nqP1WkJ+Ebrh2lYICvpzwHKjGIBI6aEpR9fqsdBe5HmW1sXfZKML3F6tC/sDH
         CMkiC4qqP8TXTLSxAnlI2w04+riENEwr474scWQAR+kjYovbW5z7oL0WJL7WJsOBnVz3
         b51w==
X-Forwarded-Encrypted: i=1; AKwUvByy0i5RSy3h5d4o2vFgKqu+G19BeWlPZGo+wS9Dn++qUdFWZvi9kpkDbXwtJ/nQ+KxdAbmXgF6fqHqGribH@vger.kernel.org
X-Gm-Message-State: AFq9FYKiLZdeEZ1YzRUskRVt7Cg0BsFyyeTgajUIuNyb+yqyXi2Y0Mx2
	4g6oa45z0Z+c7gXaWljSiOMIvG8rUVaG5jzbLp9DNWdbNpye97AhDwWSizk1CM7yNXjNkya6gOH
	1MNP3m7DvLGUBIZKM0t4edG1n0LbRKiDDB3hKpLOmn820AWq7/BO4wPNnAS5IOvfckkf/
X-Gm-Gg: AYBFou13K6qNDKDaMcFsUoY+zzWlxMMK0oZ4OrSAZfbzUIhI8tHCUMLRJf57xbYz2Vg
	of5aigodpWwN+UW8Quc42Kvygqek8+8pUyPda9FwRJNtKH/Sp7qvOBZjBrg4c3swjjsuIB4KElC
	IfSA622IaQ+KTcc2IPoDsiyMxWprVUbWwAwmYkkEgkQ95pPNCa0bgVotwF2I2aoJC6IuUtSWxNK
	Y5N19+woQe0HdpiJL6kpFkAFfwDSkgU/cNLwGl7SPiL6tefUZTIHDNk5Qw40p5bvO1jYXXIdUwt
	41tusPNbHq62ZkVV//VeLqsopEdh2QxC/W8va2eDmbI6dIlzgxEQMGNvOQh7UEd5eKIMiQ24nA1
	J0nONDQjWlSlrZaapEO7gqA==
X-Received: by 2002:a05:6122:e012:20b0:5ce:23fe:84d8 with SMTP id 71dfb90a1353d-5ec22ecf6e9mr1504124e0c.0.1793016111258;
        Mon, 26 Oct 2026 05:01:51 -0700 (PDT)
X-Received: by 2002:a05:6122:e012:20b0:5ce:23fe:84d8 with SMTP id 71dfb90a1353d-5ec22ecf6e9mr1503020e0c.0.1793016106287;
        Mon, 26 Oct 2026 05:01:46 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46c59c063csm265518866b.34.2026.10.26.05.01.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 05:01:44 -0700 (PDT)
Message-ID: <9845762f-c667-427f-a848-ee1cb1291779@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 13:01:42 +0100
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
Subject: Re: [PATCH v2 1/6] arm64: dts: qcom: lemans: Remove FastRPC compute
 CB9 entry
To: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>,
        srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
        arnd@arndb.de, stable@vger.kernel.org
References: <20261023090308.2898683-1-abhinav.parihar@oss.qualcomm.com>
 <20261023090308.2898683-2-abhinav.parihar@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261023090308.2898683-2-abhinav.parihar@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: yMrObtiTOAldcGZxYBXf19LN_G4PQcxi
X-Proofpoint-GUID: yMrObtiTOAldcGZxYBXf19LN_G4PQcxi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NyBTYWx0ZWRfX4FhPPKp+NQlx
 xHfz1nBKhqICuZbwG1f9T6s1uCQj9+jgG51xPzfZNPw6QOFRPhGqM1ir3rTWCXkHoW/ou2XNGjn
 YdBEpYCDDtWVnGy5OM2pT3m58ayPObUiTtQAwis70bzwNyeJLG46qnwRf4G3VhDiQwgG4gDWR5y
 KCrymVjRiI6XYN4KrdYnuLqecZ1zQEzjj3y0pxcsNK6I6Iz85vioaFUBZ1IKJvjlAIA4V97q4w5
 qx1isjqjz1ZokXXt4aTjh5k5Z+xjGfyHlQGjOzxzn7+drCKV3dgtyzU8zIDKq77w/w+l3AfzkUP
 DOLqRC1suDXUNXg7Y4IT19M+oornlRFVup8oE/SitVc33BN2Mtw/gbFUQvdmdHPkBeytU1yMmms
 sBxiFvvObpfPcsASdijm/gQt38EoE3OluxMf700LL+9MhuvYgI/KxBe6v71FvVOj7GcO/QEIhWF
 EXhxHr0dxwiYUutYHsQ==
X-Authority-Analysis: v=2.4 cv=N8+8hG9B c=1 sm=1 tr=0 ts=6adf4138 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=khcIRSTurGpjo1Y0ADwA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NyBTYWx0ZWRfXxFFOC6yMcEoy
 ghhuqW7KJf85yrIDJUhOB7UWfkNNfKtdGjZjvowfldEUhV0WYMzDL3uwUiN7RdCWhCUFqelDfOD
 4FQGh2CnNMLW0+SYL25rYocNjg47Vzc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260047

On 10/23/26 11:03 AM, Abhinav Parihar wrote:
> Remove the compute-cb@9 nodes from Lemans device tree to
> prevent clients from selecting a secure context bank for normal FastRPC
> workloads.
> 
> Secure use case support is not currently implemented upstream.
> 
> Fixes: f7b01bfb4b47 ("arm64: qcom: sa8775p: Add ADSP and CDSP0 fastrpc nodes")
> Cc: stable@vger.kernel.org
> Signed-off-by: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>
> ---

The documentation doesn't concur this for this platform

Konrad
