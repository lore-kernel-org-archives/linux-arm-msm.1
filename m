Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793884596;
	b=CtB+6uFYVGAM2t+SA6X2s5pxY/F90tJDOVISPQrtF1ZFA0kXq8sO7JXtxs2FvT/hjh5S
	 VF6jkVqCcXG8A/EWdmYK83Jl86Ic8dFB9DN0NeBgm/BhjQ7gR4/k0VGr5hooAWiHfZ0az
	 ImFEjAquxmB4OlwTw2rkgVJU4kI6XUjGCP/RSMEYUaFC0AStT2uAMkgnrFIYrYCzTbosx
	 aUAC+s42/uTw49yz9vsKPD9tzJSx1OuLxEjlu/bW8DjDqRInYkMgEg4Grv+jDxIBwwX9x
	 ZnGbyTMqFY5jE9AXe696YJJ2nWVnzUWX6uMGD89wfXIJ2OSvPeO++1VN+Tm1uFRMbmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793884596;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BQjd9rrnkPjYMwArfA9FYliMwVSym69xMCbh5BRXbV8=;
	b=N7Dr4k5MM7/Ek34Kxmam6Jgarl8paG0Kc03AKdB77A566xId60R/5THisYKy7IjNBET0
	 6rVhEMisUTETcaBsMdjuMpc7sbVNCDbujibWYgoLjEBBTNrzh1hhXp1SxcCB29/W6aqDi
	 zHkkBYqrTwBAlmp90qosDlTmojNHSn6yP394QVq9Q3V0AvwtFNi+oomM8pattaqW5PSLC
	 q24POqVrWI3PmPadVEzRtBhfepjZgqq+hUxHYxpWY2poIbP26udv774pYBO/WUafaX2b2
	 B/xzYTwpUqbl3p0khVkk1FE65/ybI9d7aAGjJquFNTuBjuHWo2HRV5868LnOfO0+Qgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="mlLm/5/u";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AaYlpuK5;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EEDA606D803
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 13:16:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EEDA606D803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mlLm/5/u;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AaYlpuK5
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5A1QIU1416476
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 13:16:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BQjd9rrnkPjYMwArfA9FYliMwVSym69xMCbh5BRXbV8=; b=mlLm/5/uHHXkUXs3
	Zflt46dpp1qf2i4nxLhhb/W+/5FsD0pbicAD3o+LolSsTQXIeKoPYP95ZJlpXe6I
	sqpczlbM4+VLCl/hjWnJT/bVtsg1GZp7BeJ3i1e7dXIBj015CLQyQbXlGrybWQ/C
	VvdBFQQRsCIWnGZkV9GYHafbVQCa46/rLKwcaWWXU5tp5KNgB1DLZaO79kncRywg
	VWOdmY63T/NQFYGp5YrfCi+lUBIAv28Hb4Po2jj+LFS6gQ7fxOz0qPxw4z3CUmz1
	5Y63uKXcOMZ4JZCfg2IEIY2VWPovPs23HwzXxFQXp8spXUbUr7/fMYPWfX4qDBex
	mUbpJQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrqpd0sn0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 13:16:35 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5eab0ea26afso73233e0c.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 05:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793884594; x=1794489394; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BQjd9rrnkPjYMwArfA9FYliMwVSym69xMCbh5BRXbV8=;
        b=AaYlpuK5+H7azlTpt6aNiNO6taFzt1Sy2iEXp7Nm2k5PzhG/JywdL15b1fvqI3W3+7
         7h5AMIKI/yoeZdZyqfQVkkbOaN1WnfzBJNXnO0OlMjiDeQqcx1OoRYXWpFqCg8XHaMVE
         84Mc/uaml6I+T35mDSE/T+wYQEMU1v+t52Y/j+9QXQ1QewDghX6QO1CaRLSsfGVuG2Uc
         ZwSINFba+qm0SLIo8cNxxexy/VyYQSCnOVQfvcIB+71CX/Dkvg5YhsS9TJ+Jo8tY34Xg
         MxTaWGYq1+oQqJB6mJMhfBT4wl7m8xmcuKsFaI8nWD3wW6LGdNs9YR+M2UDf4NiUXFFg
         zbww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793884594; x=1794489394;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BQjd9rrnkPjYMwArfA9FYliMwVSym69xMCbh5BRXbV8=;
        b=XzV052Tv1sgD1De6W3CUM79EUKl26bDl9XkXyhrz1i95EsA77YL+W3qG0uH5EvK1if
         uMlihbqdUkevdt0pqBtqZTqT83+rhB0xesbmmmry4BFQVnK5cPKZ0vNIPySxJby2uaqF
         IguLfyqQ/jwBUI1IlZ28ZnbBaYD4i50xhTSh9FM8J17KG+z3Q+UBWjpwFjOkkJsZHZrC
         S1lg9pvaVIEjAj42unezeBlZ29lo5QyVwE52zZyuCI3GYbktNUV3QvvcseTIOHppn/EC
         j4qRMrkuWPNfiJ1JkDhpWctexic/jYZefo7dP0oCNp+wyqxCnp75Kc5G7OuY8Ybu0/No
         vLOw==
X-Forwarded-Encrypted: i=1; AKwUvBysaw0U/BSQSLC/ZaUjeNrZ1r+i6CTAR5/3XehnqHlNXomGbvfjvadNOdPRBU0qM23Q2ZIw01NajvFfMkk2@vger.kernel.org
X-Gm-Message-State: APuU4Z/fCE0H/kFlWXmwn0A8mOC4Jg2gTpc1A47/k5g9gMi3cuMZzOlN
	zJW2NkBvIKhPVGqjsH9PSfAinpYxC9ouxS+q3TO9a/pPAxdvUZ8JlOtouIiUU/SlhGtOYVnkYMx
	xEdFFA0UloHIkPOCs5qEp0k6pBq7/1i+oMJcK7rQ5VjewIkfWWMszTMhpsRvy2+i9WKmH
X-Gm-Gg: AYBFou0++49PmQkc51pgeb/v73vDbLh0P2Fi7J4lyjLzW3K8+1aZQCLkBpA/c2DQUtF
	6XjozmZ2mwwthffdocB1a5OhMcTS26b3ZtMelnlCbRpmOssJXz87kn9cTNETgJQozJ8lT4YfjAn
	ShHFZHU1AX/3yl0eZGssmQsxhcTWrezjgobnBPYI62iPdEqrSx12ahzRFsgiMtYIGFjQFADP70W
	Y/teR6u1eU3V9SAe3bibeM35lxuw5XRt/ChYwta8zlXRdEjkVy76FaGIEOMZEryZzgPzHdet8qU
	oLZN6fFSpghHEu+CM8R56Tmb0SAV9LCRokAY9bol8NouSRXV9ts0tBn+FVaexoldaaCifbHarRW
	gZKqihrIkoDJiTEZCYfLY1/oPDm4mU1b5Yenkuq9AtSyTzqJeI6ZL2d7kp2RXGMHZmMBB
X-Received: by 2002:ac5:c7c6:0:b0:5ea:d67f:fd39 with SMTP id 71dfb90a1353d-5ec68998269mr9998808e0c.5.1793884594273;
        Thu, 05 Nov 2026 05:16:34 -0800 (PST)
X-Received: by 2002:ac5:c7c6:0:b0:5ea:d67f:fd39 with SMTP id 71dfb90a1353d-5ec68998269mr9998771e0c.5.1793884593827;
        Thu, 05 Nov 2026 05:16:33 -0800 (PST)
Received: from [192.168.226.1] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d0e41da78sm172632266b.16.2026.11.05.05.16.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 05:16:33 -0800 (PST)
Message-ID: <8b93144b-08d0-4333-a334-804eadf04cb7@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 14:16:29 +0100
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
Subject: Re: [PATCH v2 3/4] clk: qcom: av1ecc-glymur: Add AV1E clock
 controller driver
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20261104-glymur-av1ecc-v2-0-7c25a73fe811@oss.qualcomm.com>
 <20261104-glymur-av1ecc-v2-3-7c25a73fe811@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261104-glymur-av1ecc-v2-3-7c25a73fe811@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA1MiBTYWx0ZWRfX4ZCpH7VnJmrI
 9tbOHT24EUqmqTpRVr7aAsGAE+VZ0XuS1WR2aDKtKDu1Gy/KpErzytOtNuUsiStmJLQRXylYEpo
 NB3AVdXJVrSyeGDlCd0F/EqnpgAacds=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA1MiBTYWx0ZWRfXyF2oXqy4xWvx
 5nh7eRUyxEjjSxwJba1g0RWEkoEgHhWbU9+a2tKmv4zUbBS+fqEnMpDFVED0Gt66gATOjaLElEu
 3iTVt/aRitOFKiu5nZ1NPwmJtgz7khpxk/EKhYV0kG1a2eRkuE20NoWqm6lkSi3nEHgy6dlwdX1
 6dBzRE4TuktTWJJLUrs99Xwih7hMyjxRwlL1eCBO3hJ0pTZsjB/VK4J5E8I1crBle2SGp9rwAoD
 8UNBXjBhpqqPR22CYQ4bs4T6+i9ZXokbsTtJJd5f526s5B/BUbwlBKH1gjzTWaPWf2153hw1CLx
 3/nqAleAx8FMcw5jRUIgqBSkqc9uM9qZkSWMhWvBBg+SBULHqFY9r0C+QZCqya5KdrHKMkYEOy6
 K2J4GtXmpOf3AX8fdjt4a9obOD9J3TlMHTGasLcJrxx6myVgTWSjCWLJnwpnmVVXzcF06rbgcXA
 qpz8wOacZK14JfthENg==
X-Proofpoint-ORIG-GUID: 6G9KkRNNFAzWJKaLwWVKQzOtky8q0Fu_
X-Proofpoint-GUID: 6G9KkRNNFAzWJKaLwWVKQzOtky8q0Fu_
X-Authority-Analysis: v=2.4 cv=Y5JtIReN c=1 sm=1 tr=0 ts=6aec81b3 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=_WYHhi0DWFvV3-2RZcIA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050052

On 11/4/26 6:07 AM, Jagadeesh Kona wrote:
> Add support for the AV1 encoder clock controller (AV1ECC) driver
> for clients to be able to request for AV1ECC clocks on Qualcomm
> Glymur platform.
> 
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
