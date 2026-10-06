Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5716E3A9628
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Oct 2026 06:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791269711; cv=none; b=NBOq38/FznPXkaMaVjcKIWmOuNvhhnh2ZBfm8QXBT0eLryOe9TLRq4r/f6EFPnWUgmq+zoXf0sjVIpJPnKv9NuG53/qPf7HXWPGi/GHMc8tuxp2krb7WqLNOhabnY+9JovV1TmQoLExSaRSEgz/xc6PpqLEvG3yXd/OfT/hJmHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791269711; c=relaxed/simple;
	bh=nK8pW8FyxYkHIGfjwfpvtntGSDU60cB4CLetxgsm+ro=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YDgTR659vFQsEB+q5vRHmtTd6ppjye8PVYlpO3G2MvZKSepbph7/Y5jgfKqKwVhPNNRip47RZNByNrElgPc/ehPvJGfUYGcwPD5jk4PkujoI/o2Ep2Q4durrqwVktWUvfo3zJ89IJwEWZZSdzmlKCBHaS09KogtX5n+TFddp6IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WPIh6dBG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dk7+nO/u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WPIh6dBG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dk7+nO/u"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6966eFfU2834276
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Oct 2026 06:55:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y5PxqJ40x2v8dJl0fOyaxhba7K80AnLZ15CfFkyJEmI=; b=WPIh6dBG//0+31dy
	XBH768JezKqmM2il0PgBIx7FTxSpYClSIBd853bhStaR0G4H45OIZV9gf7g9uC7a
	4sMB4+shGa6STqpzWevWK30nXo9Vpkkc3EAlwgxSG17WnKxtQ1MQa38UgB2p0tZJ
	rdc74oFujh88EufvP4DSwOC8rMHeE7rqSTGzMvXFqWV9yz9lWogQ57rHLqkZgIDR
	+iKmLKxck7BjE1U8pIlkwV0CdQqy6LSE7bI1KBdUqTe9UIFFghdi2T4tbWw+hmhj
	cqzqAS1iAcIxj4fMeHqm6l4Vi//2EviPQ1r9vdmVs3xVRCO9Lr36aweqXm2rnPI/
	E/jc4A==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4dncka1b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 06:55:08 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7c103b27ff6so678160137.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 23:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791269708; x=1791874508; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y5PxqJ40x2v8dJl0fOyaxhba7K80AnLZ15CfFkyJEmI=;
        b=Dk7+nO/uCSOSE8qiu710JBWmqCjmS33n5YCYrkp+herRY6z8PMcHI9roMnAndOmd6s
         Gel8SzDwY90HYkaUxHCO2eP6LAxK0cf0S9tL5cBRGvF05wjFc+CQEHSLEm7nt3hxuhzd
         ZBD5JAekNR9EAlqpGvgUO6VmF6cbQOpPrpAha63RxQS3uOxg+wWaxYJ9RpUOEXV8+dxo
         tqlLQPn1fAeRI3ohrOze4xBzFjo0VMtS8RoTv2GM7dpBpbzavu8FQ7Q9IciXw+uLdO7X
         JOLYiX/3TuaPc9HNhkCT5fcb3KoTPmewKVV7eu0J7vFkJ0cxmbff/vEWGc12RPxE98KM
         w4Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791269708; x=1791874508;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y5PxqJ40x2v8dJl0fOyaxhba7K80AnLZ15CfFkyJEmI=;
        b=KA+Tj37tfPh8V2JylwpXvmTndzaXeEKfbAy9CQEHGjnTtM1CZvhHR9e5vtDnTqOgyn
         xrHs3irp42pcT1f5203nRbQ0wGnWDMXQg0W5r//+K4pubNB0nTTzZfJrctOk2+avtq3l
         ZLcZbq327I00fQ74dGvou7dQ6UGiY37/ILjzgdq0lwmW87DrmKRPgAg058MyCJ0Tyjli
         Ztbk9KrkKJe+mCdc74T3vAjSz5K7j/7AGJ6t+P1Fvs13TizirpFlyJFEvoQtGYMdlhK0
         vSzJ0hySFs2E1Ss7ten9xaLhFOzR7VgVxUMa1JzpypTb57UIw/Fl1o7Dh9/SHYsE02d0
         ULHA==
X-Forwarded-Encrypted: i=1; AKwUvByamRmdF+QtE8PvES4sOg7gq1T+zuFw8xahQ15+SfgPjNAnX0K0NqogVgvIijGbdztYiGgYi8IbOl8sAqm4@vger.kernel.org
X-Gm-Message-State: AFq9FYLYnfzL/h4XHJjw3DkIOzBloL8Obb7enQ10bUM+i6tq0mONDI6R
	OhLi3vvw4P4znhHLL1vGdXbKj8zbaclT6nlysvxXDPEyDGZHtRxTUKjPibEFzne22ygn/B5zyl1
	OA4SiWnpyLMTGPZOAQv5A7zN2OlhggmJGiUB59wiqp0GdABfuHSKS16W9GKGnwV66hGS1
X-Gm-Gg: AYBFou2KtqsVHfph0HhUmtWMbqGQqqSH4Eb2kd6BEhPiXe3wV9KWp255ztGZvI9zkTp
	CEpG1i92RtvAOuHsREfmNGhbUiediI2qz5MVu6BKrguWMrC89s3HmWnxDsxTVsJmtTYsJteEqJ9
	MSqSeLPe6DcSp9Xc8AdL5V6BPibwf49lL1oL/WlLyXA+vy1NL+pkdXcr+dItU3uQDLSoVYW+NFL
	EEZhivOPTvWLarfy0NefbaVP2GIthFMQRwsVCJYxISCXaFEr3LOESRWMXJwkUj4V3I8oR4ueWQ9
	n5lzv5zRX5U4OopeiQEaTTSivTow5r9rj7D/Q6hCwWz/b3I+awYYd3K76DxkYGF7trpUKbPnhfg
	nq5YVF5DmZVBbj3v+V0TESwJrFKgNiyo4VX7wcDY55HcfOF8iUyOsQZ57vlOYKgn7asuPCta8Os
	eSsDzBKCRrzIea
X-Received: by 2002:a05:6102:1359:b0:7b7:39ec:51d5 with SMTP id ada2fe7eead31-7c7e0d83003mr382419137.24.1791269707041;
        Mon, 05 Oct 2026 23:55:07 -0700 (PDT)
X-Received: by 2002:a05:6102:1359:b0:7b7:39ec:51d5 with SMTP id ada2fe7eead31-7c7e0d83003mr382403137.24.1791269706528;
        Mon, 05 Oct 2026 23:55:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a87e303fabsm52162651fa.21.2026.10.05.23.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 23:55:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org,
        Joonhoe Kim <26rote@gmail.com>
Cc: abhinav.kumar@linux.dev, jesszhan0024@gmail.com, sean@poorly.run,
        marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] drm/msm/dpu: disable the slave encoder before the master
Date: Tue,  6 Oct 2026 09:55:02 +0300
Message-ID: <179126968609.1110179.6720784693254574991.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261002130712.50612-1-26rote@gmail.com>
References: <20261002130712.50612-1-26rote@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAyNyBTYWx0ZWRfXy6J+FMctzhDu
 MJ90w6BPoVIRGCeCSZf6PIHeFfIrYeGEuL5LKNxR3bgA+YBO1A2nwxcykbvHxtO9aE3DugqiYqg
 PFcjMc8x5yBmXf/SzGVXQx+NI+4vWIg=
X-Authority-Analysis: v=2.4 cv=Vdxir1p9 c=1 sm=1 tr=0 ts=6ac49b4c cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=e5mUnYsNAAAA:8
 a=Nj1YSEbt09hXx5T6n98A:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: lJrVD5zOprCsFuhATB6uCSqhBXt7t2li
X-Proofpoint-ORIG-GUID: lJrVD5zOprCsFuhATB6uCSqhBXt7t2li
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAyNyBTYWx0ZWRfX64ENZhJZgG1p
 1twPV4MKAKmMSz1cfbP8r4DXaW0Wct7Q4wd9CLoZX96BVY5CSicklkBvcSB8NRcWJ4JKOx+d9Gj
 71OiN3/VI+snEyJKLsG27jR9pASwn5aHSJyxG9NbeGoTv+T/OHL9nF7DvqKhUEUY47t7uZ6cleI
 2Cfn9EBb+bNfH9QFSLNzEyhjl9+vgdN2qHFcQc7+FE6fnSqcCp1C54URhYXJxGKzSHO1QU66En7
 aOxmZxS4m6YDEfeF9c9lYssT6wIYt7scAm/VrQamq4NEdrzLLkoEy1F67bxxTCoBPp6HDFpKKTf
 43IhRiYtQp/KskqEPmvMyWnEe6un7r6j01424gkHgMJOrO46SeY6a4yYMAhs9ZArm4R+FSsj04w
 JOtXt05ioXwZzl9dhTx7+NPTnJekKP88SwnH9gNHxI74SeOHY2FHY2McxZNxNZRbYFBkgQx1++y
 KhnwIMiazMbDy8GeniA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_02,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060027

On Fri, 02 Oct 2026 22:07:12 +0900, Joonhoe Kim wrote:
> dpu_encoder_virt_atomic_disable() disables the physical encoders in
> phys_encs[] order, i.e. the master first. With a split display (two
> interfaces on one CTL, e.g. bonded DSI) the master's
> dpu_encoder_helper_phys_cleanup() then resets the shared CTL while the
> slave's timing engine is still running, and the source pipe is left
> stalled half-way through the slave's next frame.
> 
> [...]

Applied to msm-next, thanks!

[1/1] drm/msm/dpu: disable the slave encoder before the master
      https://gitlab.freedesktop.org/lumag/msm/-/commit/32d04280ddeb

Best regards,
-- 
With best wishes
Dmitry


