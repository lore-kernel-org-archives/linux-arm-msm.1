Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E15B3E5A01
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 09:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784713852; cv=none; b=PHxoJKEZtTCRnOyAGC7LYIOWsuEmSO8Q7yYgeeuLT6hfV6gBgNp5yrzG3EioE+BawQuW9B1bv3BImWCPOcKBLtHjI7QzYirMzboveBae0YwiIzawHfbkUJlglw7JMuU001Oq+2gLcl09JP+PyF7WxsR8y6bPL9+8EaQYpHaTPAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784713852; c=relaxed/simple;
	bh=zr58osoMX0jqB7Ny+PyJro8uAgdhkpoQJr5hOMzDFy0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sQy5Ya9l5O6wjCc2JrfbZQRWQW9oYP6s63DLQuOXN1f65SRyL7ziCfQBSR9ZVsAD7T4E8J8Rh3sDl9vvXTNLhIgkVZwL8UBCMO9RI2WTieV3aEOFZBPtFyA9SVSeFtT4gfGEAAYv0lUVxt10TYknf2JMFhWEn31EVko0uMcwOGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T+yPaN4x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EvcXTpt8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T+yPaN4x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EvcXTpt8"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M8xKCD237568
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 09:50:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=d2S3NyHe7JKxNxgaSFpKvPq/
	rKGPVUbh4HkCUkp0pt4=; b=T+yPaN4xCigNC5oa/en9SmTdTOMoSifsGS8W2UkB
	S9UcGQ4BfvtI1dqU4J1vYhxtYjmkXBon6Wh8WsvDM6L8iiljaN41GLL9HJDejAUc
	QyphX2mpDQ2VAkhaTMUy3+JKTmWhb/RuIu6sPTuPX+30bFm8iL/ae5jztVsNsFHa
	Km9E+BDObU9X9c+Micf3Gc94VPX6hNALZToMRBhL4drApev1Osf64XVrTJQRezLt
	D0hBBjtQo3F0f2wZDL1zSGFSWXTsXU72Ghnr+b/46fzpJlbJcvO3xHn4cGCh2zPA
	tKE4idNRgv5yFu0tuwOvbB+XQo6M4bSppba9LGW9PDqYtg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjntn1guf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 09:50:42 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cc640dfde3so105449705ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 02:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784713842; x=1785318642; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d2S3NyHe7JKxNxgaSFpKvPq/rKGPVUbh4HkCUkp0pt4=;
        b=EvcXTpt8LhtN1KcEaLyWUHyrMGpFf57B6DVWgjejDjqsRtpKUfd/HeOb361PPGQ0Ko
         xNf6S3IyHYqDK3+koKYqUWP4NLukP8rQi5HGiGhXRNzOjW7Ssn+an1Ri+zwFGHUZZHoP
         kQsrkFe6nblIrBdGB0Gc/NWSR4fARHt1Rp4NVDNZY6m/ASLip9eUwY9AiHiN1W5DdSkK
         SBuXL4W5iVeLtAAY32y4ACrjEdTec7GpssY+oaPiHCIA5CrlpKhRQvOxEJlqIBFjqOgT
         DixN/UKyGEzHQGrIBLk+EJ4pO++nLWe9zhPrT73o5oHicHqjBuGUxtISABplQ8kHJO0s
         8lww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784713842; x=1785318642;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d2S3NyHe7JKxNxgaSFpKvPq/rKGPVUbh4HkCUkp0pt4=;
        b=dB393drG1klC0f1mxKt8dBZf4I7XbaQOcru/FbJkzIQG1lFJYB1soJ4uX/PGk3nZ7n
         p8LpzaN3boNWUkJK3eEuGOnp3JYQaRHPZI7NlYpAaBPzUMUvCssL20le6ISvCdr5Zwqd
         HZ3GvCa0V5scVsegxvC5gjKLykcQ0q/qBtupyn0G9j9TOw6lTRKDST+sVzp0A8TAZ2TU
         ddGCH+WTrxHF/I+1bVfYk+J3UTCwkvvPL5jVwY93Y+duSi4wzLQf/Ea4P737mLO/8x3f
         QIG4rf6UfKR3rXTnddL428RXmwwI6SSJI0SM/1X0byzOJoCNh43fjEdvoTmt3AJSUr7J
         aPxA==
X-Forwarded-Encrypted: i=1; AHgh+RrCxA/BUF85O//R54J8LAITYQgXNQFE/94BfAK0S6E7f0vO3veMIC4ktKsfeI8Pur6qmlCsCy0VpJldIofr@vger.kernel.org
X-Gm-Message-State: AOJu0YxIq0mKqOs5z50t3rgBEuyd826veJ9mVH48sD8Tejq7WaZ55eLZ
	swhc2moHG+wvywMlUFf9vSDCGORW0TPA8vFPLrnOQ/lrJ0LWC6BPlG9DUqaJAOPmbLmSDIRjAvk
	TdVgZ6reYoxH8hmEC6zcIVeKipJ05CkTWb9HY+C4MPajkzTuCgtorPsi0vV40iiZ+7rxC
X-Gm-Gg: AR+sD13WeGq/OiqcxbB80NyWNbGuWlEWxWBavds1hEps/7+pQlhDbzHAJSiR9Ev6fPT
	kinaYH6usL66GxTqsOJKt9jMijlPsxW+EVCTUF4qMpflIgrWt/ECyaGyLngbo3BA6W7QLS/ajcV
	sCeQ3wBobau+efAnwn2kTFXk5Vn1MAJ3tN65yhtuaUWA6+bhQWboQY/w1hVsmOlMGgBIUx8quoi
	ZaNQzTyd79jsUdgpVmP+1dFBrNVc4avmujv0lnVSHFUThPpiCfRjyuuzx8URDwG+a1/E9H8P5aq
	zMn3nOa8Rkwn2lEjpOhP07WokYEx+FcFzFWONXLYtgsy94lHOG9fVT4fPUQPuL/mNQkZdhPW8/u
	fJh9ulPjyV1fEma6IXgUXC9OmQrTummmH/w==
X-Received: by 2002:a17:903:15cf:b0:2ca:be8:62d with SMTP id d9443c01a7336-2cf349b5923mr232470495ad.32.1784713841737;
        Wed, 22 Jul 2026 02:50:41 -0700 (PDT)
X-Received: by 2002:a17:903:15cf:b0:2ca:be8:62d with SMTP id d9443c01a7336-2cf349b5923mr232470145ad.32.1784713841271;
        Wed, 22 Jul 2026 02:50:41 -0700 (PDT)
Received: from hu-pkondeti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc8b0cdsm7758862eec.11.2026.07.22.02.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 02:50:40 -0700 (PDT)
Date: Wed, 22 Jul 2026 15:20:28 +0530
From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Sebastian Reichel <sre@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        mfd@lists.linux.dev, Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v23 02/13] power: reset: reboot-mode: Support up to 3
 magic values per mode
Message-ID: <38115586-9913-4d6e-9447-e82aee811dd1@quicinc.com>
References: <20260714-arm-psci-system_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com>
 <20260714-arm-psci-system_reset2-vendor-reboots-v23-2-e7453c548c21@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714-arm-psci-system_reset2-vendor-reboots-v23-2-e7453c548c21@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=AJsSZ1gA c=1 sm=1 tr=0 ts=6a609272 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=2zDJ_gd8kjYVRJQFbS0A:9 a=CjuIK1q_8ugA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: oNielnohxFkkd5hGY9hqlQLsPLgYK-_T
X-Proofpoint-ORIG-GUID: oNielnohxFkkd5hGY9hqlQLsPLgYK-_T
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA5MiBTYWx0ZWRfX/lsA2RRHaVJ8
 d1GSPnpp8qLnXNyM5hcdgEOf5kFbwj3/0gxQ0oK61++7zCKactD1YSja8kly6oVBVPPNKtE3iK1
 v0pADSatTiDknyeyT6RXXZep14rtK1s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA5MiBTYWx0ZWRfX+PU+mu34OcY2
 YPrD6WBdzQmHP8P4Oh2mozW9MBAjz9dL9iU/iSJ9H7YfY8Yo0I4MSkpRtPnVuqr5T74p8QNOr7/
 p0PCyf/fh4ubwseMgzz+h3wYKLHU7CyCGxp7IOu3kj64RoDsMelB00BZS1Q65wzJ3SCO5CUqXdB
 9XMDWTQuhh/XllyOUccuWk6jOyB3Fry7YQ+O89428AsklD8uthfNPB0I/aUk+WwirPIi634UKOZ
 2WADcibQKzEHJHvj5yz5fvhrRUWXp3ukgRF7OV4sGNFMngfwLn/sWYqPcuxDve3nYusUFmxNEJJ
 R8sIRuhzoEC4FqNmb1ncXyLarAigPZszoCsJYinZ3xvo0VKssKDv3nOQi4sZcQRGH5zSfEOOpf0
 fMsM7L7/qW47rC+gRzHbidjutu6um/sYGE2Fh2lseIYx+LGL91gKjcuaB8e006bS1h6qF3AEcRO
 DamJUEqTFJIqSB+YJYA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220092

On Tue, Jul 14, 2026 at 10:46:30PM +0530, Shivendra Pratap wrote:
> ARM PSCI vendor-specific resets, require a 32-bit reset_type and a 64-bit
> cookie as arguments. This cannot be implemented via the reboot-mode
> framework, which supports a single 32-bit argument as magic value.
> 
> Extend the reboot-mode framework to support up to three 32-bit arguments
> as magic, per reboot-mode.
> 
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---
>  drivers/power/reset/nvmem-reboot-mode.c  | 10 ++++----
>  drivers/power/reset/qcom-pon.c           |  8 ++++---
>  drivers/power/reset/reboot-mode.c        | 41 +++++++++++++++++++++-----------
>  drivers/power/reset/syscon-reboot-mode.c |  8 ++++---
>  include/linux/reboot-mode.h              |  4 +++-
>  5 files changed, 46 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/power/reset/nvmem-reboot-mode.c b/drivers/power/reset/nvmem-reboot-mode.c
> index d260715fccf6..ac69b5f39fb4 100644
> --- a/drivers/power/reset/nvmem-reboot-mode.c
> +++ b/drivers/power/reset/nvmem-reboot-mode.c
> @@ -17,14 +17,16 @@ struct nvmem_reboot_mode {
>  	struct nvmem_cell *cell;
>  };
>  
> -static int nvmem_reboot_mode_write(struct reboot_mode_driver *reboot,
> -				    unsigned int magic)
> +static int nvmem_reboot_mode_write(struct reboot_mode_driver *reboot, u32 *magic, int count)
>  {
>  	struct nvmem_reboot_mode *nvmem_rbm;
>  	size_t buf_len;
>  	void *buf;
>  	int ret;
>  
> +	if (count != 1)
> +		return -EINVAL;
> +

The count can be different per mode. Because `struct mode_info` has
`count` member. This single `count` check across all modes may not be
useful.

Either drivers need to use count passed to them or drivers needs to
receive `struct mode_info` in the callabck.

Thanks,
Pavan
