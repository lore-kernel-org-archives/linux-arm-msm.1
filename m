Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794451221;
	b=kFsK0J4UfqrAT/ZZIKFJxtJY9mcw12VwQ/X3L0mXIjuqOWOIab4yHICwKtaAIAzTwRsL
	 2BhJUjRyaEMiDZL+9ewWEFaoiCwBx0UBAGJDEzlJz5KjJE1xy/qZ1ip90p//NloRQIPUm
	 KQg1K588ZKcvIW85HhcO010RdS10ZeVAYxN5FxbLYYRnmLpuoKGXshaatWaaG7oqdzsxA
	 FiRfJR3T0xFNMk7Zs5IUkSgRRominPmOyBvmB9NQcwvcfKNiOGgUrOabIIVYZwL19ooEi
	 xsoYeBRiKr91EwhR0PqrdMdjL6m9yQ86hg+a8kk8QccaMMh/WSH4Gllk5RVCOobPE5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794451221;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=iih96abnjxj/PozHFDBWYCK9JcXmwzDO9tgu+OyMggw=;
	b=4CqSCa5MR7ewzG0V0egqO3i6WRLFy0oNjR+WQy+KFsqIS3edumvl/MmNSorsBtlExXE4
	 nGmzBnQsaxikaax0BgGJDnz0qPXStP/Cp/wHD9PGFe9im6zkJgzgHG/dh2AYrHR74UNZX
	 oCF5fEGvnkIoegZZ4Lh3mr2QKhLTFack8wGadXyjdLwL7wYdLLmExnXZqHhuMwsUhC9Gb
	 Yc/ZVcItzfs7j0IpYjGYvMJyjz6AYMlZ/1R2IBYDKi1jFnghf1dpEMTsQAo8fU51ViuDn
	 f+H/i0QsomTNMn+LmPkkSBHsuGyYJ42bpM9GPQIyC9WeYZH3TsmFLdMcEd5PiUpRvwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="KI/qRF06";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PSq0EZqk;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF02606A31C
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 02:40:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EEF02606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KI/qRF06;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PSq0EZqk
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2Zixv3061624
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 02:40:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iih96abnjxj/PozHFDBWYCK9JcXmwzDO9tgu+OyMggw=; b=KI/qRF060qDr0r2Y
	cJuOgXtsBpuDssWcFJlKOO1nnz751BpTeh9oz1oPGvjmslvWwhtLwO06nYw9Mz4r
	ecj4zy4uuMABNaIYsfdpdtFlcLHOb0GPfLodjZXjXNDK8Vf+XQwfP+fvVcSjA1fG
	8h4TorsRex4rX7DoDD7Xb8uxUGXLLNcE7DByWRDzOUXxuwCBoKiBaRMH9GFL3BUA
	/SVMy9oqTiO0QrtV7oovqEHmjChkcnZA0sdNFtNSTh5HzTW33BNQPX4QbldT90Az
	F5ZYYFXjKa2Gozlp/vRRIx8hfdaKFek54kf3AKzEgLxcExHQcVbuPbqhhr1obTxj
	daAuAw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvs4m2wne-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 02:40:19 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-534f3fe0236so81270731cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 18:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794451219; x=1795056019; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iih96abnjxj/PozHFDBWYCK9JcXmwzDO9tgu+OyMggw=;
        b=PSq0EZqkBLcGccJMP0Me92Gp8iVJUiNrGW1URGYwVQkSEO+8t16etkBmCF1Auc4EwF
         YssLWxP3eKCL8FkcxTSWNTKnKttaxU6KnrEwtxMcI8nnHBWgYnifoE7kzjS1AeSlZR0e
         dOF7gqqesq7OgqDUS1XUsMYJZE54xQZ4l5BgVdJss8DcLcSyCFw+evV3Xh5TFHXrLw7R
         oproPtHZKDjFiwjGtYUmJmFFQaNbj22Sd9GJORn3ftdG6k3+mipnTT83mqiJB9CBNrav
         rxNM+n2AUUwKD5C8j8ssJlHPB9zRbmnyFEc00en73rp8p1yV2S3AcrPqaLiNxvVNXqPb
         5Aow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794451219; x=1795056019;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iih96abnjxj/PozHFDBWYCK9JcXmwzDO9tgu+OyMggw=;
        b=bMW90EobOX9fcpGsxMHlQSj4pJ8NfK/eLQrns26jtugbXyLgl7NLTaDsIk96iQKxz8
         KwVOImblgRBs41rrQC3TRivdC/41sSMZBx8kGwUqs1w1KDMZyOrSNb6ulwvhDjZFTwBX
         9ZprC6/ZLrXITDNIs8rp0r6/x/PURhUlrSnSv6qvOr9X+/pSE9qD8ACuV9UwNbV4ZLzQ
         ubcLduR1pFuQgk/gaUuv6GofajtHFoZo9AahLAQiR+QjSOsyFnfBg0FrIeJdYJUXQz4f
         ZfallbDvolxFsaoe21aidFMcs8lmrnAgUS93zTXxE1q6v3q7tXcSdlXiLb+ftOoLIeqz
         aZ/w==
X-Forwarded-Encrypted: i=1; AL+hErGqyuVIzCnU3TaBGe0+DcV+naLhkOy93CBRzRsyWFFLrjp7rz22PVr6MasJjtkMd4Vzv+Mmp4d8iQktud6h@vger.kernel.org
X-Gm-Message-State: APuU4Z+qYkNyud8qEAguOXFzdrlu4zkLJ+Iv9ImnCC5M1n6eArnJ2hvB
	0Ei+qdTj9z/vxuCjuTww2Xj5+56uqvre5FLf3CzMJAyU0Hfhp2juiJiwStJXpBBKjp1uk16/k1A
	Hw6tvcvuU44manHXUXkObBZFm0MOamS8eehuMTp4/3mFvASJAjGE+RjqlrZ7aRVMWRrfm
X-Gm-Gg: AYBFou2Fs3+9h7ULNeqez1Y6t9TnQ2ji1G9xV3oWX22voX7cRvUD6krgQAdso42yOTH
	Os0H3FEji+rBH3zQ/5aaJQuv3g4aFTwQIwcokwo0AaaoJWSMuDZHCDacBV79vfb2U7tB46NrajB
	j+6V+1vAKLRLdhmawl2gDdt8PuV6Yyk7hpp0vKhUdbR1w8q2YT8WvuJPvDUHcnXD/2zsFAEnWOA
	AE8MRvJ0rq07QRaJ/IsTnz0tgy8H55RacUSh0HdVuygIisc1SgrhMOWAVobVFvsYKWBFfGOhoY/
	szLn9aoMG+utP+TkdDp/3wjVSuomHxfERvYGqw4zrQMnif1GJ67dNLf9GkSpUqNaRFVjuCb297J
	j0Qj0MWpk2IrZhmI09APVEpfKp8LB0govoBYwD4XQZHxKvEjArZt8OI01BqRZ1yiy4Y/M7kHI6j
	lVInkTddjhiszrjvbOsOcmZ2gKIM7MB75FFqHx+w4=
X-Received: by 2002:a05:622a:4e0a:b0:536:352d:65e9 with SMTP id d75a77b69052e-556c25188e0mr64865871cf.65.1794451219020;
        Wed, 11 Nov 2026 18:40:19 -0800 (PST)
X-Received: by 2002:a05:622a:4e0a:b0:536:352d:65e9 with SMTP id d75a77b69052e-556c25188e0mr64861391cf.65.1794451209677;
        Wed, 11 Nov 2026 18:40:09 -0800 (PST)
Received: from [10.111.167.254] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5550bd33340sm64426881cf.21.2026.11.11.18.39.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 18:40:09 -0800 (PST)
Message-ID: <ffe9dd90-909c-4259-8a57-2ea67307a95b@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 10:39:56 +0800
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
Subject: Re: [PATCH v8 6/9] drm/msm/dp: don't take extra references on
 multiple plug events
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Tvrtko Ursulin <tursulin@ursulin.net>,
        Francesco Dolcini <francesco@dolcini.it>,
        Kevin Hilman
 <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Pengyu Luo <mitltlatltl@gmail.com>,
        Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
References: <20261024-hpd-irq-events-v8-0-6ee949e7a384@oss.qualcomm.com>
 <20261024-hpd-irq-events-v8-6-6ee949e7a384@oss.qualcomm.com>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <20261024-hpd-irq-events-v8-6-6ee949e7a384@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 6aBteixul5hbB8Qt7Fs9qprZ5d1RZZNq
X-Authority-Analysis: v=2.4 cv=OYANnRTY c=1 sm=1 tr=0 ts=6af52713 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=UkfVDg3vQ6na--iosyQA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 6aBteixul5hbB8Qt7Fs9qprZ5d1RZZNq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAxMCBTYWx0ZWRfX6x5zPFSG1+89
 wsJBobnufDKt8h82+W37hC4gG5c2FhiISE/jvv0+dU96bNE6XrKh5aaObcq6NgSWTTsUbCyr3yP
 UqPDFkiF/JYP0JIsIMSH0XToO6SVxhUbksZJ5sBF1+tZIVfewnCmdRZX6HLuoWbgtllRC1SHBUG
 UoXLdaW3yo0a3myST63ywMzyYXEoJ1mApCbvBNpVAG5hl8tN1XytaBnr6uahwGzS8jttDQtXBET
 a4U+PvEYm6bN22DC4fEDeEWILGK5c6KKIZxF9HLmiMAGZ2HQyi6JyU1NdGh/1rLvuJjJu+K8m2w
 YdTQUAB92VTNQe1xlb5A/EwgIfi3FfpVuUswFN4INzJZhfOPUZuPLe/VUCs/QdTbtGQgLlm0iN9
 XuQHmabrarDkJMlqZ/zZDzaRuiCNZqiUdQqUAYxG3Mn4lGcYPPZF9RN66wPRT6sQD0Kpxv6+uq3
 SARtYifdKDi1kji2K5Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAxMCBTYWx0ZWRfXyjrL5zrqjH5s
 jmtd0+ZqtS3hD5i8gNK9le4b3OY6QW+dJpZK5lFpM67HPeEMa34uChb/XBC50Puf6yNsu86eaHV
 UhmgRPLzK9AHT/lgz4QDJd5xjyyOsWs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120010



On 10/24/2026 8:35 AM, Dmitry Baryshkov wrote:
> The upper layers might signal multiple sequential HPD plug events. Don't
> take extra references and skip all further HPD plug events until we
> receive the unplug event.
> 
> Fixes: 3ea2d1c3d154 ("drm/msm/dp: turn link_ready into plugged")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_display.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index fa8942922b53..ce919a26fba2 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -412,6 +412,9 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp)
>   
>   	guard(mutex)(&dp->plugged_lock);
>   
> +	if (dp->plugged)
> +		return 0;
> +
>   	ret = pm_runtime_resume_and_get(&pdev->dev);
>   	if (ret) {
>   		DRM_ERROR("failed to pm_runtime_resume\n");
> 
Hi, the issue reported by the AI is real. There is a regression in the 
SST case: when .detect() runs first, it sets plugged to true. As a 
result, when msm_dp_hpd_plug_handle() is called, 
msm_dp_display_process_hpd_high() is skipped, which causes the 
subsequent failure.

I tried removing the plugged update from .detect(), and that fixes the 
SST issue. The display works now. However, there is still an 
intermittent issue where the wrong resolution is selected. I suspect 
this is related to the timing of the EDID read: when fbcon comes up, the 
correct EDID may not be available immediately.
