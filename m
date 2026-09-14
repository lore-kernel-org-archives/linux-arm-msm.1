Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4AD44470A
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789388716; cv=none; b=MSVcyujaoiA3e8U0zOcVnXnvcoWFR348kLEN7dRPOPTlPBGqbp5uI0GnzU3wVj5CPfy10ZXdfFtyP0M4WVdpFBmOOWIjz/KPp6oBj7v02aQNqjfiu0oHZTo8bwpwoz+bcFJms3KlEwlWZDVVYjjvefYWWF5k0FiEK5/oq7XcQg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789388716; c=relaxed/simple;
	bh=V7li5Dw9nmkHeY7iCABC8exOwEM/gxkTUPUJ2FR2iOI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mYo7owqBerxWyuKD1ONzO1df80GU1+M10IsPLNv9d4Lp0/gzfD8XK9mFOO9MA8m8zfPNc1IQKVzds/C8HLOExGG8C0XCY5Nb5nIxxz9Rb3psIO0QikuJ0LAtdJWtzKiE3zNJcxDjw6VQhZshGNZu6ynY8DZkBZitAbrRLv1HJ1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JKBxH83T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jHSTNckB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JKBxH83T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jHSTNckB"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm3kw902013
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:25:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jiFJ73bnfwYbpydUm5rz06+aMTJCWc5/QgNe5wl8U14=; b=JKBxH83TjqRwSHXM
	Zte67Hw1iWwcYYHyXDYH4xhk+RPxPWXK3HBiOYk0WqpT9pF3oY7PjsVVDd8Iy97Y
	FY3HHiTU8EqynGWKt/1bkuThd0z3CbVm3FLqp1pxojjeytkl6Pm+Xkp9zLNQMGhU
	FV7zHKNWUUhH5wathlRMzX3IP3iJ3cSf4t4AY7h50VSe+I0zVEO+ztWqm2/YXoT0
	qrTTddIdEIzLVyBILQEL0vRtH6rZHd6cdiVkNznHR3F6N6SH9/5y7aAeadNb3dBx
	cduwB4USFMDkoWz3hnV81s6aer/Ybv1zGZgc5YoMfZWdrUPnwJ3YQCsNeg8Ai2uO
	3muDSQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpdevrtx8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:25:14 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c8383e6a13so56651e0c.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 05:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789388714; x=1789993514; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jiFJ73bnfwYbpydUm5rz06+aMTJCWc5/QgNe5wl8U14=;
        b=jHSTNckB+eu/Wvg7gSdqtzgEY2/U6Ha7eY4+Vq0NFs1yQ/3dSzNG9c0pvAoXdixLHy
         PjPUGKh83lTPRQKLdox/3HylZe9+xrFqll5lu83AurCp6xiTLKAPuAq3IyJCCsH6qu0r
         7QmC/sNat6z7E2HAqXq7mykpwzj1GTJHnPvrS0cdDrREep3ZIeIn0N/ZY7YoKxRD/Gcz
         sy1YUSwwfE/4qz467aHB2eOFDmGelxxcDrFYIwaAw8ax3splnP2GqgaaMhC+QrCB29qa
         cfUjOImJaqv+LxxYA25dg6dvNHs8ZwZ8ia0xd3xNa9VRF4RLj0mFkZDHAIC2/2mQcDON
         QGSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789388714; x=1789993514;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jiFJ73bnfwYbpydUm5rz06+aMTJCWc5/QgNe5wl8U14=;
        b=XVNdwT17KqCyj6z4xIbgbAyTpm6NDt8+cxFd732BP6ksg49kWVXZ8BJm4jDPOaplGV
         W6xUJrKvVxYkaL3aAFXbX4TzjSzFOnl3H17M6yvcysMuwlrYlDQZ3AEzzroc2QkaUpvb
         hbOBpQxK9NpwX1E8EBU+EYHAEZLOssfTekdy1Lr5GYjKfFvvMRa/YZQXQaFOwzinkBrx
         82KyExm03g2VMWWx1xxZgxYHVghk2mUQkfdO3a+NovqqCyWTqPxMOAB3KUe+Esr/2V8Z
         nI6mxWdIRoEbsklL05/Oe6MEAzQ/C91Zcc1Cd/9h/ooFhP9qQEHc9W15F8qPnhf1fifi
         JwYw==
X-Gm-Message-State: AFuF++nlNQ9rnDHZo2IQ/2GjERzQmMGzk4Q+FuOS/PMRUVft6UVcgbxe
	56N++pH+efiVizgvDKLqfbKAloOH/Hn0StaBOL5aWF3kem1mX/EOuGLZVdGTs4EyL95NXnhlAej
	Tk0TEXbLsXwq5XvZLJfj3nZeUHWLb+88BhvPIOw7CiZT8VfJ294hjvZkfKwCg0B8sqhJSnMg7S3
	At
X-Gm-Gg: AYBFou1B1oJ53ilvFWDITZm+ypuBYT1p099X39hnwnw5L5aCuUqTXqLg7bd2VrDdRfz
	67UjYXPqMkrg1P4HhyY8f2P6uFUw2xix0Rod7zEu613/X6sEep8j5CkwGkDuVeJ9ilrBDkSCteF
	wXArCl3Pq2MEMSRXF8a3kqSQeYy4pTYVBDjGqKX6oSsXZwL9cQoYzmQaMWXLS8KzknlwKHzzTa2
	Shs8IJVvbDtNbf2KAs3wjOfBmXPbwato53FKRKn0nDTNfmrdmoPFxEmOW273LKS+cqlB+wXN50s
	nDP8hKkzdlZ9wXwzC8fIdb5mD5t6Ut7w/zDqL4mmUkC3IYShnsC8jNvnuNxjZmaZZ2O24X/wA6Q
	XU9LIuEbxKmWaP9AUGMteDw==
X-Received: by 2002:ac5:c8a4:0:b0:5c8:369e:a493 with SMTP id 71dfb90a1353d-5c981a821aemr379214e0c.1.1789388713676;
        Mon, 14 Sep 2026 05:25:13 -0700 (PDT)
X-Received: by 2002:ac5:c8a4:0:b0:5c8:369e:a493 with SMTP id 71dfb90a1353d-5c981a821aemr379164e0c.1.1789388712971;
        Mon, 14 Sep 2026 05:25:12 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a0464430sm2440450e87.42.2026.09.14.05.25.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 05:25:12 -0700 (PDT)
Message-ID: <ccaad097-6bb9-4905-93e1-acd22aba0aa9@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 14:25:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/31] arm64: dts: qcom: talos: Add domain idle state
 names
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-13-660c31187819@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914-b4-idle-state-name-v1-13-660c31187819@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 9ezvIwssFUGwPJA0ZZdM4xJUMgaeRPeV
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfX18YKfXeN4eQi
 jBh/TnHpFSfK2+/vhhpLAS28YUfGL5kB70UfqIhb0ea74RhpltXGirGlTyxuhxpJ4zsGZ10eTzT
 DXt5qsaCiOkjg8TkISlqgpj2xYBhLfw=
X-Proofpoint-GUID: 9ezvIwssFUGwPJA0ZZdM4xJUMgaeRPeV
X-Authority-Analysis: v=2.4 cv=ftpJ914f c=1 sm=1 tr=0 ts=6aa7e7aa cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=HAnpKfeiUU4SruykqnYA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfX8tmSvZxr9J4E
 BmbgNAH6IEYO4UkHZSFcNZwIh6BBMFM5NJn/nSaaifn/NMcI5lu1uOW465qd8RGiTDXP786xzLm
 Q5/1TNpPJt4FdpTxPVty6DgkTp0OMph8oxZrYJeR0cKlUgIKi7DWRS9qSNpvJgj4KojIJVTyd3S
 k48OUk5DgEYoYsxO8TtyCjRLv4EIVWkkwyU9ru3q4ckNJ4MRSzAUI+3ZnlUkPHEy2AjN+PNrG74
 8Z61eeF3bpTL+/V1rO2eYTLdU+QC79N487KhKVcDhZvF0ZtpKv8CdKqzsQPm7niHdaNuX4yM3LQ
 7rAgUa1SoTz793zUARS6HJkV7UZuuMpdpM5SDV2O5jNOaS5MUqzZ35/bPx0XH5varC6tPQo+HG4
 6unh2lkQEZ4l1R1YEWcJuBlmWuxmWyLRBzYZdw6iJJuce2lHQcwjnYwItVir4LH7gqEBZDAwqRL
 /rzRgYdP3IDketJncrw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140177

On 9/14/26 8:59 AM, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> While at it, update CPU idle state names to match the low power modes
> they describe.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
