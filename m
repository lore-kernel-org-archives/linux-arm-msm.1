Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417424F4734
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 16:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790613989; cv=none; b=p9moEzVmxpfrYFtfXXlC3y3c7YA8rOiYuTjwR2QhtjxEn90IsE2mrRBH4Z9AE5qz2MrhBAISry8ev8SeehmHG0BWF7UaktqVw1CylSrAofO01fvSMw7TEbuFtV05FzZZ3JiNRpT7F6fSPOBcNn5g4DrFDzYReX8+loNtC7rWVvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790613989; c=relaxed/simple;
	bh=wUgGtA7dLjx1lOGU2OV5DEmUzecs4ta1J+YCw2zPXZs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ImAjAy7cTJELA3b8WFEjt4JGzXFxBk7Ahl+uX/2jeWx3rGWzE1WnJUVtjH3vOeLztdsyBskwp1S+quqBpDftVD/wyooTb8A3+idrxkKarmtHBxAM3/T5UR2pzSs9V/XBU2yoaBiXYhljjiQCGvvMEbYIIFu4+z4W+pTU2J6FwtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JyIv0RSA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TrVhws4G; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JyIv0RSA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TrVhws4G"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SEdwrB2755837
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 16:46:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Y1uRUm4Mo5eB3KKuXU2hZKYR
	+aEDg87giYh07OUbqjo=; b=JyIv0RSAPLr6JQptCu9MOX7mPKUUSPI8mN96f/tg
	9sVCgrtVux9OCIUV/f2bpcJ6U87A4u+fDbb8DZNLgvMDgO5XEL2wIHsc3fLGLuar
	sOaBdiwDR2U7BYa61O/1VdrQp9qnxE0z4h1eILm+5TS7hUADMTiNMGviqv1Qepl7
	qHw5d4Du4OuowVJLsbvmcbial2hNGfDJvnmeYK4QsOB7fZ4XSQA7DpsWXwFQvdde
	NgGLAjnryUjOvYDcEcD+Lhh6vaHbN8KxreRTAGdy3bCc2fsSyVnQEdLD7wd+5Jya
	FOW1xkFa3oLP0F0IRiToCdUVlr0NH4O1dbW79KLE+jmKjg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyhubjkht-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 16:46:24 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7b4f8ea38f7so1525791137.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 09:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790613984; x=1791218784; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y1uRUm4Mo5eB3KKuXU2hZKYR+aEDg87giYh07OUbqjo=;
        b=TrVhws4GT2rEfArYpnD33ljhKx15TkEEX5ugdes495AYhOQnRPtQ6Rev6tM9XjNVRU
         Fvn9uGgB7TYsHFLdguUYBnAVkK7FL5oz7EQHHmRd6OX3NvRqLZwe1LqpKGFImDB8wE/S
         oixrSe5oamQWKmwzelYOLZhZXim4Y6upEKjzinfS+J7CVuK/eb80sLLtlzsKaV2pJxUy
         RbcV7ORN2uBE7Uu+9tptAaOmRiwQpreGM8PDMcuHPwr+E8fkz0kt8PCGlFbOgWKbMJA+
         b/Q19z1RrtLU9JQVDW7uj+v6OoQcfjle3rGOIO1ap+bf2Rwt8yyrrtqDoh5Fo/pKNIjU
         q1DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790613984; x=1791218784;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y1uRUm4Mo5eB3KKuXU2hZKYR+aEDg87giYh07OUbqjo=;
        b=tf59csMzjmM/XOId5eEWsFlBNooZIscjoJpOtZHDYHsrjmCRE84FHJzeeusdCFTxAm
         bM/p2dNxVt8lefy+Hr0gjABtC8LXItEdEuc5yddjT02qeVczw3JXHHynZwLXqB0BdjMJ
         OJgmeqXNcdK9EOE3veO9aRD2OTwMMQw/AbhFek+a6LACA+IYVVkV7Y5Sh0lTQkfWV1zA
         mOH6mcv9E2wlfNSJr5eIY+3SxMWNKkst/T3w00NnNgcDx122n8rQGBfL6XQwrRezqbnE
         c9BvZFsaPmubMS/jFZYfzRdJmKO4HemLaPN0WHbiErlD/AuFf60P0zetaIwBhsjPxx3I
         FJew==
X-Forwarded-Encrypted: i=1; AKwUvBxve+Tk0gN6SHRCZlZ9Hp2zfNj7Rb2DE0ejUJFhJo4dbv59wEZvOp1crQqWJgrd3jzlRl4Mcoxm7HbVKJI4@vger.kernel.org
X-Gm-Message-State: AFq9FYJuH8f2opdWYqLbnOTllUg6Jwe5w1VD10dEYnO1XKrCLT5RTNAo
	ykn5AhPY2gi1NloTZyh3ta/t5zoihpitv/wgjG/Q6RT6mFa7rcm0o5Hs7LTEFSBvLmKwX+p1jf5
	ZmkP+3gc5WlYCQhWWWgzkktNDfDUVnrCY1m/iPS2X9A+PiKkJIYOvVdTLWyCSgLCDJj7x
X-Gm-Gg: AYBFou0ptTUikSpKp/TqQjUjN3l5y7a1t4PiN9u+4xXl12JAKLdkOFbzResTxsys30R
	QWFawlZPnzbgsONa3Ag2TqKMVmXVfe5TW3ZLv6h4QqXjpA3ac2RkalGHWhlMVKPTRlBtk6wMljV
	Qar44SHE2Qv/zKUfwuq06tB6g2UXG8dJ6v98g8hylzBAuoEjwaVC5z/ticzqOAEKso+dy/gmvYd
	4x/b/X16kr8IZpB2UzUPg+w/O3w3pkN3mJna9XnkzW9nf+ICK98h3mCweCYVaozeGdF12zOd7fT
	gQSg9zCzanZxvxU8hSaWiZqth/LS4l1gjIyu8dxohBIk6sDinb7uKetImyRLaApEG/i41BPJVB2
	kykCSVkWSjNWkG8E=
X-Received: by 2002:a05:6102:2c0d:b0:7b4:2acd:fb9a with SMTP id ada2fe7eead31-7b42ace0b41mr1518647137.25.1790613983755;
        Mon, 28 Sep 2026 09:46:23 -0700 (PDT)
X-Received: by 2002:a05:6102:2c0d:b0:7b4:2acd:fb9a with SMTP id ada2fe7eead31-7b42ace0b41mr1518400137.25.1790613968218;
        Mon, 28 Sep 2026 09:46:08 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00d0ea071sm4017915e9.9.2026.09.28.09.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 09:46:07 -0700 (PDT)
Date: Mon, 28 Sep 2026 19:46:05 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Dale Whinham <daleyo@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: x1-denali: Enable IRIS video codec
Message-ID: <s6fxuj3ipfz6nl2hm2pdcpgaj5fxx2rpurxtdfy7fo2srwqe2i@smx3fy6ukxzx>
References: <20260925-sp11-iris-v1-1-967f1a3a6b6e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925-sp11-iris-v1-1-967f1a3a6b6e@gmail.com>
X-Proofpoint-GUID: lYc2U_d7_uN5Mg8x0J0rdZLYGcf_j8X9
X-Authority-Analysis: v=2.4 cv=C7F8WgP+ c=1 sm=1 tr=0 ts=6aba99e0 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=gHjZUIugi9cSBFQiOBsA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: lYc2U_d7_uN5Mg8x0J0rdZLYGcf_j8X9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA2NiBTYWx0ZWRfX7FtOSzM8Asgi
 vZqzoTIG7wrgv8CH8BIO6CkZXmOBf2zFbfCw5wthfoUPZ79moStSa6Pidrb7Pic5ONt5IG6iKQ/
 AvzI/os4kOUFgpBuUwr+PuxdCOnQcdy5QpsZAFnb+tcMQMGQklJtV/NoiRpDWrIm67ZVPqMC0yC
 Yho5b7KPi57CeBVhDNZsMxK3qJWihVKx0HW3WUkqsUd2hPsLnrgGGySFYpmcYp+FNsLOZXPsQcr
 dxLnUL7VWR4HZsi//Sp66zCzq5WZKuJm3pEqffw/w/0WDIv2Mc6RU4ulCWbUthwMSUKTLfQZl0d
 lwkG09cqHNLQu5tP7gTsZ4SZrdDiO4y+oIaCyfIFw/9qIReSczqA3eXiX7ZeIScfyoWpUA0874Y
 sf/mgU6baobr2OPziCIxJSX/e4y66GkCR0dv5am7PtoCOa0kdHEc4vLP+weq52+wZDdltLLZI5s
 6tCz+67RhxQcpDBR/SQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA2NiBTYWx0ZWRfX7ZZSECi7W0VW
 /LkONzmhPTueNmP7vqk0XawurK7atyPEK5QKO7ZKzaKMcus8f7WLJhRNS9ojc/5IOv6z5GqSL1b
 7QJi1xwLTu8PDO4KBqedXojngWNSt/0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280066

On 26-09-25 21:51:03, Dale Whinham wrote:
> Enable the video codec and point it at the Denali firmware.
> 
> With the firmware in place video0 and video1 appear:
> 
> $ v4l2-ctl -d /dev/video0 --info --list-formats-out
>       Driver name      : iris_driver
>       Card type        : Iris Decoder
>       Bus info         : plat:aa00000.video-codec:dec
>       [0]: 'H264' (H.264, compressed, dyn-resolution)
>       [1]: 'HEVC' (HEVC, compressed, dyn-resolution)
>       [2]: 'VP90' (VP9, compressed, dyn-resolution)
>       [3]: 'AV01' (AV1 OBU Stream, compressed, dyn-resolution)
> 
> $ v4l2-ctl -d /dev/video1 --info --list-formats
>       Driver name      : iris_driver
>       Card type        : Iris Encoder
>       Bus info         : plat:aa00000.video-codec:enc
>       [0]: 'H264' (H.264, compressed, enc-cap-frame-interval)
>       [1]: 'HEVC' (HEVC, compressed, enc-cap-frame-interval)
> 
> Signed-off-by: Dale Whinham <daleyo@gmail.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
