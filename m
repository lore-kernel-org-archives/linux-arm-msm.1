Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC27E38D014
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 09:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791883961; cv=none; b=NGidj4xyWrPheU0ExgcEsqYOTq9b8022LS4mgTSnzSgFCVlUdc0Nz0bU2syiM08Nsnne3+pInIuVvpx0sFIx95wciGv99uHsYBfYBD6NoCTbMAJ+EklkRYfITuR92D7Hng6tof7FL9iwLCmCAfl3pD8VX27LCkkAMFwY153RiOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791883961; c=relaxed/simple;
	bh=cbcFPermP78NZKc5qPlLyRAJgAr5+F3kxdBjMxXY43g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pCc7G/WYe5tDLF0bn8Dlk6YTAK7VjAhjGkzxGtQImMB1YVrun96RZPCPUxX4682oXTJjtRB7Noc+IqzGGj3GJwFwp7/+g2LJYBgdsl430b2NXT5IQPku8ulb6DvAKjBMb0FFPL1UUe2737zjh29vnpPupxv4Ns2zTr6i5cFuefk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=etVYrReD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OSW4zuDv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="etVYrReD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OSW4zuDv"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D3x8UG3475857
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 09:32:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sCfanTdzF+SA3fKg/IDYE7BzKnCyd1eqz0NMWJFx8YE=; b=etVYrReDVvZXmCtg
	EZgl10pD21YhzzCw+uodd/0ss/dioKLuFBkeDrId7fPMOZHm932BI2YAOYwTI5sk
	3CDOr+ley1ubJsq8FMPXLlvfUHTyz688wxhpoaQNWrtveIBDrguiRq4leanj5Zuj
	L3OuMSeCeBjhg3G17NTUm8y9qbbSzBuOmSmgmqSpPtaKcUg3ViA4SxQRRw2BQadj
	NkDPVDtkc+gsv5tcpLwK0G8jUFxAWcynFSWdenu8a4EhgckCTAXK4dMvU9bI5GX/
	R9l1PhePSndWBskI8agjIkzwgGOv7zVrRcUE3ntUTWguXp2RVvNxCXI4dRChCRJF
	9t7eqQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9d7j99h4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 09:32:36 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39b77130a7fso3387894a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 02:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791883956; x=1792488756; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sCfanTdzF+SA3fKg/IDYE7BzKnCyd1eqz0NMWJFx8YE=;
        b=OSW4zuDvAgogYNm5f/MIP01z7YIq7/fAtOIJYFAK7u5jrjZkGuZNOas5XMc/owhcwh
         /Xo62XzhM7zzmvobZ12tWee96KCfSJXgv6blfFlw1CuAb0rtxh/hO+pO7pbioyNHS+eE
         eGoQhMKiDXz22Q/jVsz57co074GhAxXw2FFPQEmcgYqig15UZo7xvdqZ3QsPv4o1fEI7
         Dd/puXZO6EYtBJby/mruwx9ns2c3Yc8XOvFShAVliwBznZzxsWGWRURPBDfiKHlVqAKO
         KOTwMxEI9htk5M65dEB3SYjQPTm1vEoEyz2UOYKp5O1oNYHfK2J3Yn01Egcp7slQ6Xk+
         /Rkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791883956; x=1792488756;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sCfanTdzF+SA3fKg/IDYE7BzKnCyd1eqz0NMWJFx8YE=;
        b=aUzUD4HPBDaS4Y+kRF2jcW3t1yMm+IiKuoTBDkfnKlVkflgstYglBbkLDHp8vB9hGF
         2xBpDLZe1yAfAd/FmoLWLY3ZSetpRJiqwQBxgbgx4Qz3yGC/jakkAoEAatdVkpbQo1df
         W0djrYzL9VzK3Ns/WE1VGXE8PTi0oX2yYdsT4L6+jNXoDLZ+shML97g74RWAUTWwQbLs
         gPJ6KR47oijCxAWYVMaHkhKsTLaCUcZKZSWZHuosjOSPfXFzPbLFjLCcH5xE1dNZ61el
         JjNrMSFKmeMVrag+TASUlPU9tP8p+l9kt3jtdg3Z1ulD9EJ8MF8DRacNsHmN7NhXtUWw
         LKhg==
X-Gm-Message-State: AFq9FYILxwiDSfI5NS0ocb2ANxckpdqH/4KZzQXt/9aj2080lW7PoKuQ
	0fSt5/JioLTB1qsRuukjl9sarryPMH9Vi4n8+Fg5f4VhReXLkwJFVekUPJeRa6DS/lC4NH/Bt/z
	Dr573sQp4rX7ugA/RKEu56lkUj5/86x1NO+Rk0GWYfG318LEruGWyy6aUVzscPyJQjSQw
X-Gm-Gg: AYBFou1r+mAm70xJ4anBSZUfJwoUYGElhXV1xCeUMuBrWsv/J8+bLS5WVqGIN01mmgf
	ES5oot7cPye/OUQwfLca7nsSw/nprGS59XETF/01njtDpN5u6+uqPzqoWDR15j+x6NilLvIMvcx
	VguwBe9KsEnROfHBszt9QKO6HFgUheIMzkAB35BFhLIk4dZ0/6haBecczEspULWvCogfXKVh2D0
	aj4OgxGLgJzRTTcVMFGQYWuNWBFRM8TmLIiq14pSlHx/1BnEhVnxbPMrlNhq66lUyYWkRLwGGVM
	1k9TGpkxkv4tiE1lJK/V24f4ANE7VH5lbs0tBrtLTHZccdO8vMbraILjHerX9Rk3UcnV59ru6WR
	GH7DcYwbPT+tNxLBrWJ80vGGsQzQXPoeC+82t
X-Received: by 2002:a17:90b:1d03:b0:39e:345b:3322 with SMTP id 98e67ed59e1d1-3ab3a60f97emr9055326a91.23.1791883956211;
        Tue, 13 Oct 2026 02:32:36 -0700 (PDT)
X-Received: by 2002:a17:90b:1d03:b0:39e:345b:3322 with SMTP id 98e67ed59e1d1-3ab3a60f97emr9055311a91.23.1791883955654;
        Tue, 13 Oct 2026 02:32:35 -0700 (PDT)
Received: from [10.217.240.243] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3d9e07329sm5141574a12.5.2026.10.13.02.32.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 02:32:35 -0700 (PDT)
Message-ID: <2c93f85d-a6f0-420a-9b7d-cd72a7963ab8@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 15:02:29 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: arm: qcom: Add Talos Lyra EVK board
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>,
        Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
References: <20261012-talos-lyra-evk-v2-v2-0-dcc9316ebb59@oss.qualcomm.com>
 <20261012-talos-lyra-evk-v2-v2-1-dcc9316ebb59@oss.qualcomm.com>
 <1cb252eb-a7d9-4eac-8d28-8d7781ea430d@kernel.org>
Content-Language: en-US
From: Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>
In-Reply-To: <1cb252eb-a7d9-4eac-8d28-8d7781ea430d@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _KHLSMI5ZqxLA34P49jh0pNFFiD4PPhA
X-Proofpoint-ORIG-GUID: _KHLSMI5ZqxLA34P49jh0pNFFiD4PPhA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzNyBTYWx0ZWRfX4gY87xRTcTsK
 7kpYyWmYOMOJPHms5xfdvYp0dA+hEQGP3nNvH0ekOLVXvTJ4fIHueS+okMe3InkXSoZY6+SWGgp
 cxe5iajnskxdFmKLPQ7C0918iVShY7w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzNyBTYWx0ZWRfX/hIvUveoTjlj
 2jR/xdYTkK76mtrt5uWF+ufRUFj6C8R2duLVGjGaqOMhQzXzOUHxvpqWu9yDZZFbofRYkl+nxL8
 9Bux+UC4H6PlC6gLd1lhhUZMm+qokTh8U3jRO+UB3moD3xImidQ+U5QsrUEebktsrDX2zqP3Odl
 GZyUMyj1tOJy/+wVmfy+t+GLlgBBxw/PQnkbIzShDsIUFZwjYjzwCitkVKXLxFPA/uepYUaN7rV
 Mej4T9zdFBtXwAwDTFhcIKD0Po2SA7e5UxW4ThNhR0WyYlPJfV2UXwEX1Ah8CrNjOWQ+L2mJ1OH
 R02vzwCnZ23/pY1crvqFWSLf0h/ulsqKHCWcPv+0K/kBNBWUs2RLklaEXhAHroJQ2pOlYxk1PGE
 7LdQ3YO2rPuy3ZhyTo3ALAy6zrJMctM0KkEI/gYOz3woER3zUwN/f6RJ12k04M/fxn64o2Q8Itt
 f1bXHc4TbZbNj8+0sfA==
X-Authority-Analysis: v=2.4 cv=PMGaavqC c=1 sm=1 tr=0 ts=6acdfab4 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=hQPrJiczcKPEErDkTKkA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130037

Hi Krzysztof,

On 12-10-2026 16:54, Krzysztof Kozlowski wrote:
> On 12/10/2026 08:16, Ruchira Revdekar wrote:
>> From: Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>
>>
>> Add the qcom,talos-lyra-evk compatible string for the Talos Lyra EVK
>> board, which pairs the Talos Lyra EVK SoM with a common carrier board.
>>
>> Tested-by: Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
> 
> No, this did not happen.
> 
> Please do not add inapplicable/fake tags.
> 
> 
> Best regards,
> Krzysztof

Apologies. The tag was added based on internal validation but Nirmesh
had not yet formally posted it to the mailing list at the time of
submission. That was a mistake on our part.

Nirmesh has since replied to this thread with his formal Tested-by:

Tested-by: Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>

will include it correctly in v3. The same applies to the identical
tag in patch 2.

Best regards,
Ruchira

