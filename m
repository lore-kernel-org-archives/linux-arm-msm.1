Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795758391;
	b=FfqbktFxC0C5z/8dIJuMGab1ela+LVsnLnLrFjhk/ZHLefqNHu14XCtBnyt/wBwrMQxI
	 0jc/9Z1HaigJUjaMmgexNK3Nwtr+rR3mJBn3/LyKK6OzCGsWp/fBAAm/2P9epiDQk4tJu
	 +J3m2s4bRbOZe6E3hupvbGpOlCVN+I+S3K1aneS61P04bcsXClXpwRzf7GykCZJoDLYmP
	 Odlyw4uaDYRs7G5/Xw82i3wORDdQrpr63Os4fI5iyLwvNIp2nb+ESBy3d8oz9Q/O8JCZX
	 u4Fjaqo7ny9wMKgdk0rXUEeEi+f+FfZ1CdoNwZ/X7dgL3sSl1d2aXX98b+pHKxJBUWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795758391;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=WGnLZ8DZG579xPOwsWzbjQJacn9dw8FmTmRTeatVQG0=;
	b=qmU88dD/T3xmftoe3YB+cWgFGK8NOBtQot00ONl7eHr5VoO6JRxgXRwpssWJon6wwmlr
	 t59D8gthQ5NzY9z+dQhADSouRgBIjCCW9jurBH7Uyuf0BsJ9WOCaywECsmvmtEavGJcVs
	 CIlcapjyzlCp9uYg2AgKqlKSv3qt8K/PVXwXsYZ9Wx85Za286WzcQ4W7mL/B7J9eMhfyr
	 0gbQsjadxI7U2aA+lOvZN53dLbE3S/DV7FZGiH0gQiAd3cB0gOS49zyvRw0G9kJAb13wU
	 7KfXIYXpUDyqUbAU5LVzHIRwZSzzo9KeR0KWU+uz5peNm/JY0WVjj2J3XCXqZ7Cdjgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p8qgH3EK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MVT7Bc+p;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1876606A324
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 05:46:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1876606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p8qgH3EK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MVT7Bc+p
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR55Cxg2830754
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 05:46:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WGnLZ8DZG579xPOwsWzbjQJacn9dw8FmTmRTeatVQG0=; b=p8qgH3EKZMLXjp7t
	fXIZwmqkWg4Nw1yR7aSkF41de3N1kQfUjyKlYwqyqWULdVxPLTokGNDiAbgjU/EG
	niXM6dKBLgaxMpr7c1oDnqlYHFOt103d9ivW9XPEt1S3y9zfNMEioFUL2M7aGJ1m
	WCzZoYAjHkV0aS8fVo3BVPcfgQDfLFIegxaYerfdH9+WCRlmA7i4TTLL0MEQIxa/
	mfcHi23IZR37w2yVd0BlTMwUXj3i0ASZHpZhkZ4Ksy+5GNRQ1sJozo7HoC7T0H6r
	uPDM80yj1tctDK5Vb/YYJuiOBg8ZGmajbDRkObu2TgMFHX/F9SbSvNAav6hggwkb
	I0+iZA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j73dh83vg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 05:46:29 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b45655b428so6739562a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 21:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795758389; x=1796363189; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WGnLZ8DZG579xPOwsWzbjQJacn9dw8FmTmRTeatVQG0=;
        b=MVT7Bc+poapNh82MfdDxqbc6smDA9+uQJBIKnEcSg9pyv0q5uz3IuO1S3Iz+cB/ra9
         WniuSbloXe3yNuUff24OfdEHQsAhZtnZWQfS9Koxyj2GdrVzmqpyv5jytGXsuxK1yIB9
         daDL5ecqHhvSgrU1gshUyHZVdF6fic80P5Lekom91adDHJfgG9iw2r3WU/raJe9nLk/9
         8eeHQUAyOqM3m3ktfQsmfd2Y/8PqJj7RYF4+225/94SHseAm7FUy57zIuCi5IvaGTah9
         zPgCC7vpByf5Hu2DjjiyZHM9UY8ihFpmOqnLU9BLmkuHou1V2D85w7BSzB1+LHTP+dcS
         Qlbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795758389; x=1796363189;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WGnLZ8DZG579xPOwsWzbjQJacn9dw8FmTmRTeatVQG0=;
        b=EvOY/thwE79d7pG5CIlIqDzMVPJpKiFDNi/3vUL0RlgHEOGD1+3yCKbqVEKvkuPVqD
         gOp44bUV1V96+w3T15gOjw/hMm+dWv03TjHPAsAyqwwVdZt3HYwLJR5n9eIN0EKYU8N6
         YExo3xWuXfXMU2czIk9L03BLQsox8tJDtLh3B/5sBBDHHoFsFodfJwraDEuI0CYAJiZS
         6eEKVANvRmIDILPJRG1dIDsAe5CTHkjBVfublQhxhf8r7b8xqOomq07DR9mtSWNUGTCN
         B26JQNwSkcamWFzdacwZDe7iSOQG0ou5PfPxkWmyIXraec5BTKkMl5D8VK94X7yekNPC
         XnhA==
X-Gm-Message-State: APuU4Z8/8hst3dt5iLudi6PukMuKCAC47sfaiNxalrSBAcvNoQw3kiAR
	khL9RzTwqwxx0xz+Ke36asX/EdsbbJB6SxukMQBqtdPjEgqmJ++hKYsHx+z+4l436FRIGkS6LDH
	mmF0KHB134L66KeBB8y3eIeOmi5kHi3U7Nb2YtT7bYW1gc4ymRLdiAJ7cBKWPkMNXqrQU
X-Gm-Gg: AZFdTZfXVMJCcB0YcAB8Y1BF/H5pH/0BhTfgmtUG01YBv4QnHmEpd3w99QEg3ZG01Vs
	IjSMxvzmoQ0jscDFL7REhxFd6XHXKbloaAqnx+LuapSwDYWyTEvDJwze2yrHFSZlX0Dkk/wvvbM
	uzxLfLJwPV/VBiIARnztoOZhRzNM1cjjuWBujvcNpO9xLJm8139WUk5Te/vLXzyyWaGOAoTx5YE
	fw2SvXbemtdu+WPhi+SppW0L3w+otTV6Zb5Wn5MAtEHlCmaFGSj+tNM5cUnn/LDYbRogHMLDCJw
	Bj59QLfvAlam8RewSOJb4fEXMLe0miqar3S+yb1k3MR8ZIOO4efDWOsQ+cOsaCCSo1ujI6KLs2+
	hPbQFhk+THzFyK8D/l3V1VrOvn9VewFklkPLgDz4iCfaf0LaVGQdShFA786EGFSNPSxgOQ+NiQv
	+AXCg=
X-Received: by 2002:a17:90b:1f87:b0:3b3:ca9e:9e22 with SMTP id 98e67ed59e1d1-3b41c9b2667mr22035587a91.17.1795758388547;
        Thu, 26 Nov 2026 21:46:28 -0800 (PST)
X-Received: by 2002:a17:90b:1f87:b0:3b3:ca9e:9e22 with SMTP id 98e67ed59e1d1-3b41c9b2667mr22035548a91.17.1795758388034;
        Thu, 26 Nov 2026 21:46:28 -0800 (PST)
Received: from [10.218.31.125] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b7c6513sm17422749a91.4.2026.11.26.21.46.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 21:46:27 -0800 (PST)
Message-ID: <aaabe6df-71e8-4f53-a416-60d53be48c05@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 11:16:22 +0530
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
Subject: Re: [PATCH v2] arm64: dts: qcom: lemans: Enable the Inline Crypto
 Engine for SDHC
To: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20261124-enable-ice-sdhc-for-lemans-v2-1-0bfa9ed6b4bb@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20261124-enable-ice-sdhc-for-lemans-v2-1-0bfa9ed6b4bb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAyMiBTYWx0ZWRfX1++DS2mJSXgT
 4VotcWrNsbYk7icKG0+4+1+OHc9ivtn3ErkVImQqOoKBUTFXT/D+zr9bh5iO8qU4gFb/P0b+G9f
 oS5mGpPlrRwrsO3C6X/WP+wPY91amsWFFv3pkthvWC7hL/cx+v73r2IL3mJ2cypPIQG8bCWdq8h
 mjZPcV26iz+4seF5hjpKZ0A9SjUEx+w3vUI2STdLZhHb8DPyCEpH9I34hSLLnJRUMi3Jvcc+f08
 l6x9Macoj6KmeBbD1oVaf3ZuSMDXCir0IRy3Sp4deawvxFDjecxPz+yKPgJ/xLh6HjRx4W6FiBj
 +jg0E1+J/oW4JVX/pZ7PGFX5HFGSrgd3looGQzvNMfQs3CVpC1CEJ+WVBDCgegw0xzrURbO5HuK
 YkG3UTbqOvjgj31Z4HsrwjOEzFEzGMw7DAFEGfnOe12D3HAeC2TEo/VE4w1t0QRthea7tKf1U92
 F5HOCqCVnYllCK1iKvg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAyMiBTYWx0ZWRfXxtJ9aYg5YvcO
 VCbQTJYq2cyeefNj3naE2fk4RjA7Qq73+j4is2ChoGTbRfuuriU0fXSrqWtH/YhXrR2pJI6GCKT
 lnKMg5z5cDUr88gIDXUidGhAwSbE0Tc=
X-Authority-Analysis: v=2.4 cv=FfiiV5+6 c=1 sm=1 tr=0 ts=6b091935 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=qZkeo8UN3jEFniS6j9QA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: DLYBYurAfS6qfDHkkGKAuWjwSKWHPMuz
X-Proofpoint-ORIG-GUID: DLYBYurAfS6qfDHkkGKAuWjwSKWHPMuz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611270022

On 24-11-2026 14:43, Abhinaba Rakshit wrote:
> Add an ICE node to LeMans SoC description and enable it by adding a
> phandle to the SDHC node.
> 
> Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>

Reviewed-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

> ---
> This patchseries enables Inline Crypto Engine for LeMans platform
> for SDHC storage.
> 
> Testing:
> * dtbs_check.
> * Validated on LeMans-evk with custom Mezzanine board for SDHC support.
> 
> Dependencies
> ============
> 
> [1] Enable ICE clock scaling
>     https://lore.kernel.org/all/20260824-enable-ice-clock-scaling-v12-0-09271f583dc6@oss.qualcomm.com/

Seems "b4 prep --check-deps" won't mention this dependency and also
dependent series is v13 now instead of v12.
Maybe next time can you update dependency with b4 too..

-- 
Regards
Kuldeep

