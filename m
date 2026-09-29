Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F3241CB2E
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 06:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790663277; cv=none; b=lFL1a8aAondvFT4Zo1Ver+Pu7dk29zgM6IpUJ1eWovD4gKM1BsKxlk5jlD78XTHmD0LNNov+4ypAYiI0aX3DTz/QJ7GnXFMKTxRn5/clmmTlBc2Slspav1pjtEgSfECAon7cccNk26740auAwdFUsa+upiGIeRMqd4+I2cjeq/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790663277; c=relaxed/simple;
	bh=mHq5AtvkEH8OOCTTKtooA5QyWIUV6+CR4Scingzbq54=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WAXwanYa6nXYH0iV0OhdSVePp6dN94u4kJ320RtS2xiY25THtHjvH0XbvvDEKCp2tHYbl1E/vT2pVHAdAmjQCtexey7buY46ytFewwdp5Qd/3CMuGYXjZ2GLSMnCKiPbq+etVjd97eN54Cjp+RPAi8+P2WZBgKcg9iOL+X6/u0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aiuaXYBu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WhH1PKA0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aiuaXYBu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WhH1PKA0"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T47Kli3241646
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 06:27:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fkg6HeiiW5RKTN6ZHxqHbSLxB7wGEE3Tjdoly/CGbPY=; b=aiuaXYBuq49qryCB
	Aqu1fpOn45GeH7ZvBLR2g7C6TOHGSWW34mcrWXDJNVsInMVBpq4LlDw3OOdBGAFd
	9O9Mm5HIO4S1PnGAqisYPhJTBNxCaVbfZtRznWG/7yD+DjqWs5/lOF3wNiC6E+pL
	yOEfPot4wbHuNmj6JkrdFUZMpHV16/CMjiFOyeoSpdZfV0QF71YGCuPta3NjjZ4K
	xe4f7u+CRqWvR/1s/J9Gw9VtowY8SKt5863klrd4V+eE6S51xTCpaVLINU0jJnmJ
	oPqtam/c7CuAoSEU1blY6F+tHrUrawfZYnXpYZK1hrQNwNA7sRGMzfGGXtXq7Hxs
	dRHSUQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0144sf85-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 06:27:54 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb11535e6a1so2254224a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 23:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790663274; x=1791268074; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fkg6HeiiW5RKTN6ZHxqHbSLxB7wGEE3Tjdoly/CGbPY=;
        b=WhH1PKA0MPYsIcJshSK4V91UjP2ov/Up+gBn4br7xV9ukYNRi8CgUDijRO2rYqa0J7
         8p3m/eRMnQNoUKj+Yk9zyAENs+1t0JdVz2yKb6wj08jaPpCohalcxKO+gPmtVPBYt/15
         jIJgx19nVuvvOqGUzgEXEkxs4O6C0dPHYatVxIqBzf3TM+OeG/P7lwSzA8JXsyjhVj4x
         6ZPxqi8O5BvJSWmKQeHbWScpzorDTG3UE/9sqeMnzDb6usgjDm1mYDYNu4WFmpxmNX6+
         sr3UlWFrc6zbyq4ImidTWZngXIbGpKMMKTqCct9SScueCNmTHhYMMuFYjlIR595BU5sP
         mVeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790663274; x=1791268074;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fkg6HeiiW5RKTN6ZHxqHbSLxB7wGEE3Tjdoly/CGbPY=;
        b=o7XQeWPYTywKoXvYkfj0eocwSjGF9Bt2JMcakGgaDBB8N6PjSFXRiCnbSqSuAg06kE
         E9nS010wIdAeiazKVlseNF9LvkuMkM+DsQU+MiULjvAbgUHlGANh6Xu07FaFE5N1Sn46
         kOLZT70nzqe7MOBQAlL0dpnc1u1t0jLCalO1qIF68rst8uIwWVgFLHn5RcKdIhhfFebC
         cviGwrDWP+cmgoKaOwgncm2/KvnIDLjyLVyG/zZIlWQpVHxIiL83qySr1u3lz3K2OeQY
         RbbAIGNtvSuLEZzTpvF9qWODmSm4EEK4k6peGFozL/OvdPa9JhG8hmW8Zt9aKo6fSQHt
         yJkg==
X-Gm-Message-State: AFuF++lobvH5Z4NbZz76gkllZrjAhF8gVrqPtHZefkmUf5qN+BL9YqhZ
	sXKfcW4OJZqdD4sQQpxYwIiTMIc0AVugGgOKjcyjgpvKw8FYwaOpdrwU04AnpNUjWPLnwrAw5IW
	RKguhFB70EXf/jtzawK+tYv13kq88ZtXQjrSh8VEkPjXc4c7/+ojpuN/fY5H16WhXh4yO
X-Gm-Gg: AYBFou0FKbg09M9PWty4zjspZzpL9OMJR5TdFuymBw4guVFPO5qclyw/m15UxsOfbkx
	HRN8ESblvH2QzEL+J36jsTe616a+FZ5m3wbFNAuvh/50Zq/nX8lClHEBBYwxtrlh7sa7/EPFeg3
	mhdhRhHWNMlOqLft3UO614kWD5bXMmjiJ0UyqMRcnqHQjNvlXRSecSI3LRG3OyLkYnCEnxO5dOb
	NFNdECYgwrEJLWjmKN03TRazdAFzQzyAeEPXuh8ojNFEpOysGTmbG1H/RFDIXXDkcpUCoWluISf
	fKnLK+kxmxHIoPv0b2D9y2Y6kVsciXW7zFj6s79bbiQzPXaMFeImTDT+guK0p1N8qr9J5pQ/BBb
	MPd8zXRQdQQfxJl42ZX3AsTdxHgNw7TcH
X-Received: by 2002:a05:6a20:6a04:b0:3dd:5844:c95e with SMTP id adf61e73a8af0-3de0e772ee0mr13779081637.27.1790663273785;
        Mon, 28 Sep 2026 23:27:53 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a04:b0:3dd:5844:c95e with SMTP id adf61e73a8af0-3de0e772ee0mr13779051637.27.1790663273253;
        Mon, 28 Sep 2026 23:27:53 -0700 (PDT)
Received: from [10.217.219.98] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc7a3b8d70csm3523812a12.9.2026.09.28.23.27.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 23:27:52 -0700 (PDT)
Message-ID: <141f72bc-72ad-4e14-ae0c-b221a8e3711b@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 11:57:47 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] arm64: dts: qcom: nord: add GPI DMA controller
 nodes
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, brgl@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260924-nord-gpi-dts-v3-0-74a85134699f@oss.qualcomm.com>
 <20260924-nord-gpi-dts-v3-1-74a85134699f@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260924-nord-gpi-dts-v3-1-74a85134699f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAyNSBTYWx0ZWRfXxqWMLJM4uJGF
 FxKwRQk2BGPR3NkMQIHotNvxNH9TR6RLL6XPgpdvVOv5LH+kEc+HsVunFEsWTqaTtXUZbe4QxbL
 ZNekWhujnc4t0sBWb373uY1NkZARRmkVtjI4/EP2gjjerJSTpyefecEFWx3KAjstP/jg2l2DWAt
 APXtciwvzLkIh3h4lH88QNl+rDlr1hI+tuOzYxWUdXlHYiHQAc66wrTNk4mrccaej/RkHzC78Yt
 7jh3NCKitKR5VFnKEIvnE4cG6CX0OBdKdMShKWIS7VL8Q9lYKIvNRxABaCp2lM2GCKdY3G8lqNK
 d+rwoD8yJezYk8JMtz07EUwPV+xPEWKsOd28nnDraJ1VQ4GzUlGtVSuV/jnyzRZ5vIWnorf6MH/
 6SyXP62kZgRZD1FzZ370cHZ93sfsXU30NiDv69au+LU7Dwv7pbU48UD/46XKHx2C9cVZeZ3WC84
 /xXG1syM7R4cC19WQvA==
X-Authority-Analysis: v=2.4 cv=FJSOVOos c=1 sm=1 tr=0 ts=6abb5a6a cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=svJ9ipqeD9EGsNKrb54A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: bDSTOAeVxfkTMyOplVCJv-hZ1qqHOMkp
X-Proofpoint-GUID: bDSTOAeVxfkTMyOplVCJv-hZ1qqHOMkp
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAyNSBTYWx0ZWRfX2Ldj1xozr9tT
 qrWmep/DBFwuUY8mnr1ETZp7g4mND+Y2STZIYgi1jhgnF4RzWgo+z3CcV+fA4UTjc1e5TW+5wXS
 oy9au0fr7rn0DJGHhcUhFbj5R85ZufI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290025



On 9/24/2026 5:40 PM, Bartosz Golaszewski wrote:
> Add GPI DMA controller nodes for all three QUPv3 engines.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
