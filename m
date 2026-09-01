Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D412F37A821
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 05:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788241399; cv=none; b=oNkKOsl3NNBjTWW9Q+dnw75RSg+vixrc/U9o58z5zFmXs3GsjcKaQBGXik7wtPX+sZ585zKsAf7iJTkdALlFuc3A9yYhtjDQq14yJbmaHWvMIrngTb/sRRbSDDBAblYtBleOxU5OIa7zBihSnQqXmSVuCOAjB975tb74+uOuFvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788241399; c=relaxed/simple;
	bh=OrT6/G6pG3brs3h5U9lP+Lp6Z2MAy8eJchC3JZa4RqI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nWTjhtkBQGQ7Xflo/fiU4f/cpz9KhMkz8zPVD/AF9O+5OnTshTjo61zAInWpXhJeKuX5iyvasZiMa8PwIKVfn62e9bU6vrmuSUNm1pu5Ge8u/JZ1rBjXm9DBlQEmsWaTatFGip5bhHd0C+MsR0mVPGNRJ7xdjxkcMBIst/Uuj8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cx7WLRJ8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mp+sB1vw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cx7WLRJ8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mp+sB1vw"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6815EVmp448028
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Sep 2026 05:43:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZXnt/eV5Q+Er/aEKGlxcy33P8n1vYu7bu31h5cpjjFo=; b=cx7WLRJ8E+gHKwE1
	wlA9+OnxS/aUmLsF5jam7iZ9s2p1aWJJaQF3FHn24xzSJBg3rQKzdoTt5aZKXEOE
	Coq4m0D+ff2Nb8EniT3yrutlSgbfT+DqXgKehkeTcLsjNCGSOQ8QXVsMNyvZtCT6
	QR6/mqoDN04wfiqeqUyAxwLCC8gOBLrGIbw4HsXWMZeYtOoOXnXHexgSdRMcNV3+
	KUfm2aslJCrRcjsCoG+ZHw4aQilS4z1dxR+589CgCixGKcPZxC457ZYkrllamVM9
	gUhPGZEg2jvxdJljkvKH8t70B6rQCW+TE+RiNuRQpjwPvfuu5LAueS9RhtnT9F3f
	hLxUoQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdrcsg3ag-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 05:43:17 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39533bb224cso6168493a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 22:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788241396; x=1788846196; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZXnt/eV5Q+Er/aEKGlxcy33P8n1vYu7bu31h5cpjjFo=;
        b=Mp+sB1vwLw6W18lMRZytiBHVkL9RPluuBeKHZZmHyA+NSk1j2qL4s9/bnh4fvz1cyv
         B7vV5fdiNX9p/76gFNyghljoMFH+DToloAsw9EU6BeuKop8rJYIePBdkuB4pL6M5bBDq
         8XZ7wGGGa7nutMyrfXCjnHvtF1n5Kw+coxeUBxRhAE09BEA/HrqqwL6snKknjV9F9L5P
         +zGLmCLt3SWItk9/O2C2Rj++xM49l5e+8FxcTYNERDMMsFcJCry5aMdKB1EUUcfTwWms
         Cn6SFMQBUo/0AyHDg/IeatlmBQbB5blzjpnHQSkk/YqXvQPtDSEzot0Bs2SvSITjujmQ
         wPFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788241396; x=1788846196;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZXnt/eV5Q+Er/aEKGlxcy33P8n1vYu7bu31h5cpjjFo=;
        b=mw0GpDONlLTRy8TuJ72j2z7QOCnNSCVCUvciL8XCf1m7zOAd8+x0LqMs5uiGCP1z6i
         cHsNdCStfYClHekrgLbadYVhHJIvzU3pl4lUgMfgyXW+YZHXg69LKN/ABVBSgwohHK6I
         u6/tsiwZUFj9tkLtHu6Xt4TaVjdheF4DBw2IrPBJ3r3tI7Durw89FlqCf8QNjczmOa0t
         D/tagWZMNrmgu1r9UbM5HwvxBsa0+mw9d7iEX+/QCTlkBl0f7KlcgzLWJgtrF6PnCmEE
         o1X3doWltU0oJZwbOr4UmaDiHmCH7+g2DxszvKQsxp0Ns/U6grzGpot2jDBWpPc/BE55
         fw1w==
X-Forwarded-Encrypted: i=1; AKwUvBzKGeRFI1zTQ82i/b949srgGzUTxNGJTHv/erfTY1hdja75YvHWfPvivtCRfRbTJyzJkavMW92nzr0ubf8d@vger.kernel.org
X-Gm-Message-State: AFuF++lowS1tJQdSJbarlVsnc8nA06KJy9F1cx0iaR6+qpTk/nKZF3GX
	6zkh0Tr3p8HAthIB2zkpVSaZhFyP9ugnkjq04kkpyHvJQetcxAKZyObK/aK26Sn4xQ2w/JLUvES
	ogPelhInVT28XF2UplrS/0ENYWFIPmMBgn5F4bOScFHn3QxqssrBOZyuDNvMoUmOtnNoR
X-Gm-Gg: AYBFou16NpW4aVQbiQQuLAE88Z+Xz6dLNKgzQB/ITMZAATnQ2iOOJ/sCrmAkHrsOBm9
	fA17Usie1uJ+GPyud+cDoUQAHO35wrs7xOJf3QmZ0b6ggDCNJ5YrPRmfnGnKnqsZWJzjb4xeaEW
	/EUmzX40FbPqdC1xBA0K7SboTfkg3nz3bSAi1U9Dms98fXQXJkDZyTY8d9i/6Lg0cPKyJZlyMrU
	AIwfdiEkqYnYQe3paEAiViiSQcNTRUZyfWfJivNBv3DByHbA7VAikOTJqBO6nIJXAzQnapUjc+k
	6LX/o33teBOJsJ5k9Oe/D0FvxssGy+Xx+zYWE1X61lVsPidde5q5UZriHVolOJXFD4T51Usk/3u
	8vIDEDhiYH/OwNA6sK/W1ONX8Jkxw
X-Received: by 2002:a17:90b:50c6:b0:38e:97f0:aa4b with SMTP id 98e67ed59e1d1-396d1017316mr49221673a91.13.1788241396438;
        Mon, 31 Aug 2026 22:43:16 -0700 (PDT)
X-Received: by 2002:a17:90b:50c6:b0:38e:97f0:aa4b with SMTP id 98e67ed59e1d1-396d1017316mr49221618a91.13.1788241396004;
        Mon, 31 Aug 2026 22:43:16 -0700 (PDT)
Received: from [10.217.217.192] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d38207sm32357246c88.5.2026.08.31.22.43.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 22:43:15 -0700 (PDT)
Message-ID: <ce91111a-0672-4b61-a38d-79d6ecf57ed7@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 11:13:09 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: negcc-nord: Add the secondary QUSB2 PHY
 reset
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260901035322.654-1-shengchao.guo@oss.qualcomm.com>
 <20260901035322.654-3-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260901035322.654-3-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA0OCBTYWx0ZWRfX2deE4heZUbOT
 MlS+BG3ikfZ/cqRwdaExLOgV54SyN4/3+XHooqap7SSVj10DMHZhJOrlTw1VdMSWbWtcPR06MVl
 Dte01fDydrUd75vY8bNFK/PaIGvdGAQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA0OCBTYWx0ZWRfXwjOGdimLtZ9G
 lisXXPupt2OhyzWFKyfOTD7/V0AotUrgu1vStenP6UxpvF4AYJC7yvolbvCv7/yiv1/irzOBd0f
 DoDLHYj5ZUjnguX6U3YcMaJy7fpmQ2MuMar/bHCJDOxfLZDNN+RI8VVkgtrnwxQZzeHw91tW5wb
 y0xj0Xnls24MWMGFqAzUoQWwWXGV6BrYf+Ouby5XhXCbaEEuj9PXjMiOFnADWLgm0O0s5crFVBD
 pgZ2zewlvki28BooVCRgu8rE2yTyNChcOP/YeI0BeAOiqh6z3jQTmrNSmP7IIa0+reye43Q/s2O
 n4+/cmFXXGW93qDRUdmupCEhpqmxOYfGo0shLBP8++gYTKWXwBysu7uGZgnjfwbiCaFN/BTdpuZ
 Uaiu9gmLeCDkDfoJRAEl5sLavzqmZC6uuuIU+QdcrVXNnMakIyWnljdQ8yRTE9SGRIcwLaeW6ry
 6dY+9jByWBECMiDhKXw==
X-Proofpoint-GUID: XfBbRwBN87BWxZ9h-bWyh_AsUNPwqfvn
X-Proofpoint-ORIG-GUID: XfBbRwBN87BWxZ9h-bWyh_AsUNPwqfvn
X-Authority-Analysis: v=2.4 cv=QsNuG1yd c=1 sm=1 tr=0 ts=6a9665f5 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=yQ5hQiGTvVYem8VU7YkA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_01,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010048



On 9/1/2026 9:23 AM, Shawn Guo wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> 
> Add the secondary USB2 PHY reset which is needed by usb_1_hsphy
> enabling on Nord platform.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/negcc-nord.c | 1 +
>  1 file changed, 1 insertion(+)


Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das

