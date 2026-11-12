Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794478277;
	b=Bqwo5PYVilFCquAlGaatOzE2XRBrAn47C4liTe0rZPinsfCuNRdalhBJoXd/UUKG3k6N
	 jLtLOgiE0Q5IEl/LPfgRUDoq8HDlItE6V/nnDdAQ/sNqCEdtx8zcowSTdUIj0lre7a1Ww
	 VcFke9a8RdtFO0K8XFyEroNGeAbYXAKpix+LSECvAge1A5AhtV1v7wOPDIqV/QFTysV3K
	 3FltaD3pcFta7OV/EoBOQSUEry7jP1Hst3NCcF3G9sa5Z8isLD+VsyVzaMZ6hZpM3R5uS
	 2o9M7STXED6NuDQJOQ7o4kYVhE710LCeOzWJIGCO+/9itSAFqT7617AHXhT4GK+H4Iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794478277;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=4Co371eAtEyBY0WhdQgTX/EXDlxY6o8hzTRzs231jfc=;
	b=K5Oimbobbq0aEptG3cpyRvTfGJhL4TAhvKcCeEZSDrsAhoG1NZHGGjJmshT4WViJ4ZJn
	 9nKpFtx94XNAHpeKSjJtFUV9ePXk9JxgNPvlDDnhIS/ct21wKt44nilbjiMIXks/ScNQJ
	 VPLwb9mZ40H4K3WQjVpJ7j6pXqv8F8sIuVx/S6nWoJtJEDM8FW7I+QeFiV89KQyedrSWC
	 9yHdXCyNsKnI/AwBvHymz94umKvFTsaYO3H0ao2RI5FlXXPomSwtZFkMZ0Fr+3fchWtfy
	 cpnHD/fh1Y5bQ3l8E226G4W7pfhVONIxphpkVEBfJxCNkAjZcfpHZPqOLP4CmdGVURQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TPl3mf0w;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eI8jmE8y;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37479606A880
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 10:11:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37479606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TPl3mf0w;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eI8jmE8y
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC9L0XB2514150
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 10:11:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4Co371eAtEyBY0WhdQgTX/EXDlxY6o8hzTRzs231jfc=; b=TPl3mf0wnEZZiYrD
	BA4Fggl3UUBrsz0os/YuZlvZRaCVUPRIPEU7H6qGyaut/36RtBgvdkXGGG1pG8aF
	cLIf4Qk0XYaJ4+Q6fjf25Cf5ep6CcjgW669TzxU/onX4FOWRJheyi4eU35gQH50Q
	PB5VoVXeLXhts9Olw/wn7LaCYNbKOkKcDZG3BxSJnUfZlBqmYsdWIJZjJJrC1lE3
	D2BmccnVebC3T6a9utJAvP6LoFU4ORqZwVRbl9albTBDIWiTCt9/Fe4nU+9JgWgC
	loIt78qpM3D0O8i7wGIlDvccZ0ev8dIZFD7MA1J+rPdgXBL5HeB7lD58x2j/rad2
	Q7Lj7A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvwm1u361-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 10:11:16 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ea63087d79so41266055ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 02:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794478276; x=1795083076; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4Co371eAtEyBY0WhdQgTX/EXDlxY6o8hzTRzs231jfc=;
        b=eI8jmE8yzGFhHLAPCVNM6t/CC34mV2VwGLvl1cgw1svegQsaU59jJzB+72t9vl4qqB
         QfWpxMb66hooyET+LZ3UhbgQqOn4rUH1xcb611QTyvYCcSIlrdU1wFkSfPwogddDk9bC
         skINiPP1QFePXVflGtv0474EZWqhf7IjACesxgsj5FBDH7tV+yE9SlKidvWdxyYzKgF8
         ObscxgeNRTX12vf1Y57O55N66DkbuT5lVB9oRH/4VQ3Io433hIvxWEt6hLYlNHDID0pt
         AH2wexydR3IHhvM5Nc9axz/R26G8LNkdwHkEhVFz6nkyrCmFHNy3pcIhJlUxqj5VJCSi
         errw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794478276; x=1795083076;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4Co371eAtEyBY0WhdQgTX/EXDlxY6o8hzTRzs231jfc=;
        b=zLYbrarwNY31SrOr0WRswUk/+myvYiQ9X4Hp2TlWtiseT8K2uYAB1WkulIXy36dYWa
         AqY9xHQTFHWnmUdGYBpDrJWc2DrusHQ37EfEPUqPW1xhYVDKzsgrA/KrQy2ahE26kgy8
         /NQUoe67HdLYgC9ScSpRd39xTJKHlLOCFcOK1bgIOKy0iT3CfttGhlk6wKbOt4YF24SL
         gOF3nys+y4vlh2SrHOFT3Y4f6UY9HOjLlQHkfAwUOWcCDxGI/lm1MvoLvHe8MJUub0C1
         /GI7OTYc2PhENsjKJzAcB9K2v5HMbmwuYq0FB0jqcmVHo19TiqnPRcalXEu2w0tdSg1i
         yBNA==
X-Forwarded-Encrypted: i=1; AL+hErFWAmARwcVXAaw1LsvrNiGMYJ0KDIeHu3tEJxwY5BLuW1Gy0mbAqDdQEobW9huxJGAaGfrqn2Rg3FsYHIhi@vger.kernel.org
X-Gm-Message-State: APuU4Z/XYBC3mLvTTiFqfIq7qlNfjVpBBZaFGzcnB5x89c0nHQ1DZqQM
	LrLiyVZ92TS2FHHyxNFGGzYDWypLHnBXRGrXlx4qELYViLigzem8V0A7rg/UTohSkWpgEB5hLin
	m3ltQ3fAfmyghmMhQyrvpMdXSDXIYHcVbnnOkR2k7GsEYSuN0lCnvMjePiBbFkVN+W//r
X-Gm-Gg: AYBFou2M69TJTvP9dwiVKvCsj3b+euStDpr82rwAwh15q0EcUtACP+mxu5XuilqMGly
	klb/3vX8G6eNXCnwu+PUnXrKACBn7PdWcr4USgnk5KqBUfAEOfDZqXX8clQ/y/agn++Hug2b4/t
	5M4P10r+cOjXC6402OsL8AfmvfM97Pc1B7LAucfxFo3zCR7WrDI9jkymplVp7BHUPC0WSGMxX2A
	I24rvStCvKaWgzWhyZvkxOeTqWgg2Gtpq9foNyJSSSql6KvoBBhDOxIgflbyPWW1keT2Pp5vGcJ
	RWMT4Re13SPOffTbWVL3OK7DrjiMaxXWtNPMG1x3IzUtKkfTEky4k5jaTaT/DqVkTQUvHwqD8Hy
	ig/HbdFeHivULyhtvZ712nFcC1f1HyVHvsWL526PALeUlKtEjheEwcQRyboi1mAlaTyWF7QW7s3
	/2C7E=
X-Received: by 2002:a17:902:f690:b0:2ed:e35b:7d1 with SMTP id d9443c01a7336-2ede35b0cfamr40899745ad.61.1794478275955;
        Thu, 12 Nov 2026 02:11:15 -0800 (PST)
X-Received: by 2002:a17:902:f690:b0:2ed:e35b:7d1 with SMTP id d9443c01a7336-2ede35b0cfamr40899675ad.61.1794478275533;
        Thu, 12 Nov 2026 02:11:15 -0800 (PST)
Received: from [10.218.31.125] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6a415d3sm32254925ad.9.2026.11.12.02.11.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 02:11:15 -0800 (PST)
Message-ID: <60d25371-4dc6-4ffa-9f20-4c995f5e0d8f@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 15:41:08 +0530
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
Subject: Re: [PATCH 1/2] dt-bindings: crypto: Adjust Shikra compatible
 hierarchy
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20261006-shikra_qce_fix-v1-0-8ac54d81edb4@oss.qualcomm.com>
 <20261006-shikra_qce_fix-v1-1-8ac54d81edb4@oss.qualcomm.com>
 <20261013-pastoral-magic-perch-1a2e5a@quoll>
 <c6aea30e-337a-4747-93be-cbaeeaa933dc@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <c6aea30e-337a-4747-93be-cbaeeaa933dc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KsnYSmWN c=1 sm=1 tr=0 ts=6af590c4 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=3XU7zFwr6z3BxEykzYQA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: wO9_c_mLd4EZzLX2Ogu32b_FCRQW29FQ
X-Proofpoint-ORIG-GUID: wO9_c_mLd4EZzLX2Ogu32b_FCRQW29FQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA0MCBTYWx0ZWRfX5aeh6XI7XVhe
 /ORqcDJbuFoOFaZYVtcbx/PlUfav13OP6yG8gnXW63IzsKDizTOMkMjCB3EooJ/gVkK9U1xaI4b
 /7oG50YHrwbaR9ydYWvkNX46qTdgT3cYQ4Ro+r+SDuf5Kx1MzCATUkIUYxG6FvoBN203xmNBt67
 VBUiKAPd6ceEr7F59ArAyKqnFCEEyZmfN+yIvUSohR78tjCSHWOO1cRQO00rIF5XsS2Aso7X+fK
 xTs8mc+oydK3WyVm9CMI9EUgKsYdVD9hfg7P2dJhdhq8f57+KuRqIS50iDH4TczijwmJHk4b5Pr
 d9ZgedMh35yTrqJs2tLd8+RNL3cI4zEX1ogacfQuapZCRBCR5AjIZxpPbNduiRALJuxUC+cka+x
 GzrtDiPAxob2qcW0MN7zEPNeFIBjswNzZN2W1Ep1xv6Ke01sAcV/99nQ8QU0Nvyo95uyEDucdQd
 eU9AB+MK6lF0qnlN4Gw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA0MCBTYWx0ZWRfX8ut4Rk6gduD5
 XWMAkd8PmQ/TDh5OpIcHClqThWFtZbL3EQ8oteK6BoCvvZLwIJ+cvK/JK+nmojwnH6jycOu2HQ6
 uc6FnvCmXzBOlxP0NC/APONj7RqPnks=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120040

On 16-10-2026 17:40, Kuldeep Singh wrote:
> On 13-10-2026 12:14, Krzysztof Kozlowski wrote:
>> On Tue, Oct 06, 2026 at 04:44:03PM +0530, Kuldeep Singh wrote:
>>> Shikra reuses the same QCE integration as Agatti and should follow the
>>
>> `git grep Agatti` gives zero.
> 
> Agatti is chipset name and compatible name is "qcom,qcm2290-qce".
> Maybe I'll mention both next time.
> 
>>
>>> corresponding binding requirements too.
>>>
>>> Move the Shikra compatible to the appropriate binding hierarchy
>>> (matching qcom,qcm2290-qce) to reflect the underlying hardware
>>> description.
>>
>> You do not change any binding hierarchy. You are changing fallback
>> compatible which is ABI break without any reason.
> 
> Agatti and shikra both consume RPMCC managed clocks and clk-smd-rpm.c
> does proxy clocks voting as of now even when no consumer is voting for
> it. The required consumer i.e QCE need to vote for it explicitly as
> proxy voting being dropped now in patch [1].
> 
> As agatti(qcom,qcm2290-qce) specifies explicit clock entry as per the
> spec[2] and shikra is derivative of agatti hence, follow the same
> convention.
> 
> Coming to updating fallback compatible introducing ABI break,
> "qcom,shikra-qce" compatible in bindings got accepted in v7.3[3] but not
> the corresponding DTS change[4](which consume this compatible), the DTS
> change is queued for v7.4[5].
> 
> So we can straightaway update the hierarchy then?

I was away on vacation for more than 2weeks and hence couldn't catchup
on the thread. Sorry for delayed response.

Krzysztof, So we can update hierarchy directly right?
Let me send v2 with your prior suggestions.

-- 
Regards
Kuldeep

