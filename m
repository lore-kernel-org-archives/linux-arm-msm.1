Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37347490BF7
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2026 20:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790886180; cv=none; b=fpINHy6ajZkQ6zwyGsOhkeW+g1J1vTY3FrCQjbJ/GLTyF6uvWI+WZ0/8ZXW38hjJHhgXsyocqbOURlJwrioMHclvdSqrIPD2hLtTlWGXbhtKXaYrTIBhMUmOdhzyX3cNFW9lXsbs1Fcg0Qne7Q9smcVIkKLEBwsFMni+Xu6GLFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790886180; c=relaxed/simple;
	bh=3qP8FPDf5DakBu1LqR7A+pXGd65AiGRjB0416cRxaMU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A3NX1aNCmroHyzpVh2PSxtAucmTB+tro5MI538h0EyXyC5FjMJ4N6K8rQCAoOVmK8MNl9xqzSjMC03ZJB7YUKnqQRaQ/xBirKwMBfv+uBLl9Y88UQ/2yQNOBv3R6V+y308VzwhN3L83ksXUOhLP/BJFi7P8w7v7DHR5bpnq7INo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pjTRilbx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TZAz2Wr6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pjTRilbx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TZAz2Wr6"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691Fsfpn3987295
	for <linux-arm-msm@vger.kernel.org>; Thu, 1 Oct 2026 20:22:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mDniYY0z46vcWvJ4WbPnahjC8lYCnyjzy3DyehxUHio=; b=pjTRilbxHyga3WmE
	SYB1k3DKTS3i9N+ilFxUOvkfSxHnt8AswQZlDSPc12CgKmdPFVPLETuLXLnESeA9
	f8f1i9VAgSIwHeFaJaq++dNJqwYUGg2h7Sg418egg9lyIugODAqMcs83oRgbO7G/
	Nxy4l1xfp1osVyb3KfIKOwdsT8xbTKxNp0R6ukfkyxu7bpWO//hdUv9eaUyyTikc
	7exPlWyVdKnRju3vtCNkEfVGmnOe6zTd6/hhXvQhif6f5YJWsBPoSaoTegeqDNrL
	3NzSbi9RRA2KeXV0Mpr/uWNyJBh6mt1abVwWYSnc96JOIO44fB7BxHo6j32HJWol
	U+eUFQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1hvkkpbh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 20:22:48 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e82060977so179221985a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 13:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790886167; x=1791490967; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mDniYY0z46vcWvJ4WbPnahjC8lYCnyjzy3DyehxUHio=;
        b=TZAz2Wr6j1F7S7u0wnj+s5XnaDOFgSfdgze1SGj0X1XhfzDcqsU3rldk9b65lPIEYX
         bxznOGG+2xcg2iF7q2ZG4G49zgiOCRpA8hwfcHiTVTHCgtUsSjFHpjuQMHgwMRB0hML7
         gGnMkH1VoJOSiU+4VkDaE8xaFwDT3vt6NpGgOKKL/LCS41nLcClpUDhC8jCTXFtru4Rw
         KpnbsaMQwqsxTe9QjmlcSTeJ6bKDBEITZPOjcj31nGYzel3lF5N/ZJxpDsPIS/etlElI
         EhlAEKxY1diSTX6tb0lwuYdpLNFv1cUQ7Ha8jFmWWlg2bYO3geEJAWjNHO5XOwCc0hdH
         iTWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790886167; x=1791490967;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mDniYY0z46vcWvJ4WbPnahjC8lYCnyjzy3DyehxUHio=;
        b=qE18DW9ojkjJ8TJFvcmCaRCb+ZzPBfk7PpYdlZXxTWQ0hVaVdCkiH28X6jbPmoy9ZG
         hSu+W4tkMXR7aobZhnqwqrMtwG4FS+CHDOBuMWiMbUsne8zLB5zLT9371b4dGguU2U4N
         vYyq3kBQCGn+PZGAZUL63Eu/Xy6sBZybOp8TdMFM/0C0ehxggq8fkLwB8rZWNtF5yAJ0
         poaFwiApHO8/P0UpNIMBYXrLSwFCn9Emxsybzf5lW8QFE1pel1bSbcp2Tn8VhWEp67v3
         BmULax5H3NARpE7McH1sA0CyhwuckhNDwK14Oq2KsQUWKVFcpuL4wDKg8+Quys08HnDp
         0x5A==
X-Gm-Message-State: AFuF++lhfupiIZ9X9aen6tlzAMk9l8Vxa3Fiqs5fSf11GM7lJCKxoaGl
	lnyZPoVxhbEqbENGkHITrLwAADaiwtXreZeoWiJP9XPptxTKLauMad7MumMr+malFd1TBCFwAgy
	QMielD5OFDP3MXszGciwzDAZOuEsc01Qekms7vh9nEG/aLuythD5LJM+YG4lBHI1N0Ann
X-Gm-Gg: AYBFou0POQkO8b0c7X3dtGreO5z6zO6kgPe6wFk52i3HbD36fSe7elojEpns928eJBP
	ixgzEfJyXoDqaKNDR0TwfazwVnPhCjA1NtgswvsBGm7saCgwcAPBu63fqD+yA74YN5sP/+dkKRe
	6UnDtvSk9MR6szk/0Lnk7wTFTX6uCqJzgaS97olPE9YVnx1TMt6Fls1do1RALEhC02PJNsrEAdN
	Bj5qKqF7WEuPeWRjW39A5Y/qcojN8Fhc0w4jN5kvX2fByC9lQnHnQBBHYqW2TvPA+RqdHSU4yl2
	fRlNC+Zp6D69DFMqgPZ62jaaeViI+KPbjetUATuCxUBIEw1cTsN+G8iqk0rGhkGFkzYAzsEK7zY
	CMgIxPjA3ZAbFewKE9/uf9oYk4xbTztbEi/jiKqqJdI6B8CpkzF+jJKJpFS9PMQ==
X-Received: by 2002:a05:620a:2956:b0:93c:6e1d:96b0 with SMTP id af79cd13be357-93cb5abb8bemr763979585a.17.1790886167140;
        Thu, 01 Oct 2026 13:22:47 -0700 (PDT)
X-Received: by 2002:a05:620a:2956:b0:93c:6e1d:96b0 with SMTP id af79cd13be357-93cb5abb8bemr763972385a.17.1790886166618;
        Thu, 01 Oct 2026 13:22:46 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:f14c:b716:c104:4712? ([2a05:6e02:1041:c10:f14c:b716:c104:4712])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027740a2fsm18335995e9.13.2026.10.01.13.22.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 13:22:45 -0700 (PDT)
Message-ID: <e34e6661-3ecf-42f6-96f2-5136afe7ab65@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 22:22:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 1/6] power: Extend power_on_reason.h for upcoming
 PSCRR framework
To: Faruque Ansari <faruque.ansari@oss.qualcomm.com>,
        Sebastian Reichel <sre@kernel.org>, Benson Leung <bleung@chromium.org>,
        Tzung-Bi Shih <tzungbi@kernel.org>,
        Guenter Roeck <groeck@chromium.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Matti Vaittinen <mazziesaccount@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
        avaneesh.dwivedi@oss.qualcomm.com,
        Umang Chheda <umang.chheda@oss.qualcomm.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>
References: <20260924-pscrr-framework-v15-0-7af87107e0d3@oss.qualcomm.com>
 <20260924-pscrr-framework-v15-1-7af87107e0d3@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260924-pscrr-framework-v15-1-7af87107e0d3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA4MSBTYWx0ZWRfX5r7s3nM4d09d
 YAroh2CS+rPxoA+uLmVgsACl7qx18Su4GDEBJmB7lvll8gzXAKorKGLCdbw/+u49Ut2oGRt3tE8
 h6lAkc8TNWPHjlhrydNtt39EB2eXHDk=
X-Proofpoint-ORIG-GUID: oQewT4-YCl0cmMiyD8PiKhH_17YNNyOQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA4MSBTYWx0ZWRfX6AQoSVP7L9rJ
 VcHdon4Xpbl4kNsYhSA+wrwPxcxU5hTHj+bd+J9k5pelAgLeYO1SHAPFhmZdNgWdtc9SVA7pHou
 0ynYDltOuva5LrdXliTJctvTx+NJF88OTb07o0rhO3ypJQhvpILp4vx8wHOWhROyHjZPgCmuIu7
 8FWKfDaHs8J4hH74JBZoEaE2JAcZaIPvP6qAj3zI5fGxT+hpXfSKl2dwvinM+2syENOOQ+6YXpV
 xulxT7EAwTaCTKY6DR3X4I4HbgAwxm77oJtRLzL71f9ChlmdjurA3KHBKpobR7qWUHBP7HzZXL3
 Dc8f7lDM0fLEp406645j+KqPcccvAV1Pi0ZJOLkOVWuuDbypiaoSCa0Y+a14XJIkVSBDL8A64uo
 e9yamFa63zbxuOHOykBUc9wHbw34/UzNWjB9QG9KhfmBJDvh+sRamneNMI/XMid/W6ta50b3PWk
 UfrJciRGhXmDKJcUsXw==
X-Authority-Analysis: v=2.4 cv=IY8Symqa c=1 sm=1 tr=0 ts=6abec118 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=QX4gbG5DAAAA:8
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=bGjUZXh9VHoPU9QoGbYA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: oQewT4-YCl0cmMiyD8PiKhH_17YNNyOQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_04,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010081

On 9/24/26 09:08, Faruque Ansari wrote:
> Prepare for the introduction of the Power State Change Reason Recorder
> (PSCRR) framework by expanding the power_on_reason.h header. This
> extension includes new power-on reasons:
> - POWER_ON_REASON_OVER_CURRENT for over-current conditions.
> - POWER_ON_REASON_REGULATOR_FAILURE for regulator failures.
> - POWER_ON_REASON_OVER_TEMPERATURE for over temperature situations.
> - POWER_ON_REASON_EC_PANIC for EC panics.

How the system knows an EC panic happened?

> - POWER_ON_REASON_EXTERNAL for an external reset source.
> 
> Co-developed-by: Oleksij Rempel <o.rempel@pengutronix.de>
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
> Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>
> 
> changes v12:
> - add POWER_ON_REASON_EXTERNAL
> changes v10:
> - add Reviewed-by: Sebastian Reichel ...
> changes v6:
> - add POWER_ON_REASON_EC_PANIC
> - s/POWER_ON_REASON_OVERTEMPERATURE/POWER_ON_REASON_OVER_TEMPERATURE
> ---
>   include/linux/power/power_on_reason.h | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/include/linux/power/power_on_reason.h b/include/linux/power/power_on_reason.h
> index 95a1ec0c403c..13e61ace14f5 100644
> --- a/include/linux/power/power_on_reason.h
> +++ b/include/linux/power/power_on_reason.h
> @@ -15,5 +15,10 @@
>   #define POWER_ON_REASON_XTAL_FAIL "crystal oscillator failure"
>   #define POWER_ON_REASON_BROWN_OUT "brown-out reset"
>   #define POWER_ON_REASON_UNKNOWN "unknown reason"
> +#define POWER_ON_REASON_OVER_CURRENT "over current"
> +#define POWER_ON_REASON_REGULATOR_FAILURE "regulator failure"
> +#define POWER_ON_REASON_OVER_TEMPERATURE "over temperature"
> +#define POWER_ON_REASON_EC_PANIC "EC panic"
> +#define POWER_ON_REASON_EXTERNAL "external reset"
>   
>   #endif /* POWER_ON_REASON_H */
> 

