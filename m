Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794592082;
	b=yrLkyvP3kBZwG++k5T9FQdaiqOY3n16rqdRDCKK5NtHRShVeKjFzVI0RLSMmSbTiyl+V
	 6maKcfJI0w4VTMzkBGE7kNti2L/AlkW31m1IoLxCJBUhBmMXy9pf69C8qy/Y8NlfyFJtV
	 C8VAc/Xn8FllkjgXZYXBIf44ijHRbIFrAqUDkDiR7ClKn9s/DxZiSYCCkbrXfB4Tco69j
	 07u/AEvYo/zglZy6jaw1LCjheMS7ajjLiqcH/lycj/as/OaTXPRPp5bciWGO+2Z2BG58n
	 FdoV9H2CbyheGWGMVJBq5RbpdDWSkPMQscWZbNxgIYIEBRlphPhdo9TlnS6duc0KZ1w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794592082;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=KsbltrIyDurmJRrLTrle+sgoNwKMPVf5IZ0hW0N52qc=;
	b=0RfE2rXtUrBs3KvPyWzYyD08t7N0iio+2Hwa7AKUB2QdMG6P1rwgTyUU/rbEDKUN1VD7
	 WW4ArVQAZ8UuEAF2F1+nanWYrWDjNcuOO/Qcbj2GKuj+5/ftIX1rNdB+JFXYBC0Zx80Cm
	 7hYPMAZNl4jbY1oNsHQabdAefKMZ31InZn2+duUGI3B9hI/NpZfxDjVfmSyYr0Y4w2amZ
	 wd00SrV8yPSp+OZ8GbVzcjQZmvkCMXiP0oxsLRZW1nvZDMdhg2KE4xNuEdiKIvAh62Zvt
	 1ojcjGEO4goy7qslvyAphg5ek6v2bKAVzc/guPr1uQx+dl36xaoX5PLFwFt818y2Veg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UQ4DHfbe;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M0EVrriA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757A2606B217
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 17:48:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 757A2606B217
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UQ4DHfbe;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M0EVrriA
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFR2Zu075723
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 17:48:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KsbltrIyDurmJRrLTrle+sgoNwKMPVf5IZ0hW0N52qc=; b=UQ4DHfbertQuo5VT
	BxZj/K3jFfBkDAEPaBojSwCJlYcpw0G6QfBFjSlmE405V072a1GFuXhx8dps8MTB
	PbAh5uclUv2E06ayHhKY6ehgB6UBp0kwIZRflEYqwcxwiMFnSMAIIOwuCRs+3mcV
	9/R3tv6iYbO5t1kNJqzLWaCgSa3tLnlGYL5h62t3ykUdrRGrzyTHjKD+uh9r+mU/
	dG7krFlKScrfjGx6wBxff0KT4Kx/zjlWQV/hOIO5rtO5WMUk9C8QjZUzUFJHZn17
	bKQxk852B8nReDUO/HbMi2QDzzqbA2+LM6+bp+UKsj/gZbhOEDrafN70tJHAHqpo
	jfn6HA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwu2mtund-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 17:48:00 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd66551e02cso1543841a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 09:48:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794592080; cv=none;
        d=google.com; s=arc-20260327;
        b=J1sWzpmpr/wUeGHve8+0973KPCwoHfoR4tEBRuSFYCNzfBptVSx5W466A8OW6fEAHD
         RJ+A0yFQ70MFBWcNkwqoPC/lPmcRgsHmz7+uW6XkTSwuzWBjcT7sf+PdrXGR052aiGvs
         gkXWrT2zFzlUMNHmNlaEdKiXRn4OTZPfy7sBPMqBDKZLmF4yrLLWv9edZ2JcQfAyNTJ7
         giEXf8NCL9OBGt5zZVrHQZTR2BssfTOFgtZr6bZzoWi1kN8BYMTtnGJftE8JLyrB2Ehg
         +zwL8Dw6OhdEPJLXMJGPffUHULr8OUvEq90fYuI8WJRXP/0FbeQByU+tppqjaD6qlrQr
         LqEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KsbltrIyDurmJRrLTrle+sgoNwKMPVf5IZ0hW0N52qc=;
        fh=zpMbHYQhc8in4dm+DIa5sD+qyETJ2fH52qBEauNsSzI=;
        b=fykFZ+n2SEsQG079fgCdq+53QfIZAIoJLBERyQfORJsSQ/SqVwt+InOa6j4KHkF5BZ
         x8xRN6DOHumL0gbsszEvCixz1ZeqLCuxGLOfCCe0A6jEcVZFJPZbjxk/d1tmnaEM1R0t
         fImFBi9eGWafEsd+Iu0tiObTF5q37bhPQ+neEbnYYovqqVIA+RrUbPIEcUnOGmynAlgh
         7AkcuV9cSmrHg7AcnjUDXGnR+kZD865R88o2GLlmVkcMLtLdWAWstjLovqt5SasTO/0l
         46Xtna+5wnCj/Cu7g/x2lKBxbOuNXefd7yEtDxZ27B3HoNYqS7XEeQEqMKEH1+l65nr1
         bgnA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794592080; x=1795196880; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KsbltrIyDurmJRrLTrle+sgoNwKMPVf5IZ0hW0N52qc=;
        b=M0EVrriASVl4BEUn6glnS5ox3E0QgX6PjCKNlaqDj3ym8AQsQP/Gm8udCSFQt0kCw+
         ojh2802Sz7G7infVLgeh9vT+7+ibuFMUycMkc158kjYEM/38rIgRwjWNPnCOWnzREcWu
         4yFPtRBAfLdprTfsG4GWSeDrPqcB42qk2zsllrrMVSRCzfadNQzNm8NY6Uxo5Yx62IqQ
         rHqSkD5+fkB2G1ZAV19sTN8Rz/u3ykG1nYUDmSau4jUO9ED+xuDPOvfH3/a41UedMV0s
         HOkoS3b7Ll6B+QQaMQrM9/5ZkPpCYbAbad3hF/OLQtwMT56Fkx9KsC8XPxSznK/Pla70
         RYWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794592080; x=1795196880;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KsbltrIyDurmJRrLTrle+sgoNwKMPVf5IZ0hW0N52qc=;
        b=HozjqEMaHfnUqyAl9mDvNOvfetY05w7E8HNCTNjh+ohNgun3UBvkm6WcLkv3Zgbg34
         Qcwt1nPVenvVdaZyK5mpu95l1dgR8ijKOjHOrwesoLP0RTpi0FM3UW8aUkhnAlPVTQaY
         eK1+u/0W9OwR6CHgPJ+RDgcCtQ/88QjfDu9uqjZwLMddsU6Xtspv5/rhcUpr3ECjDniz
         jJPhatCdYy5k35JbgS8JPe1GEAl7CbzxYoXGr0cj1QIlSBLzQv5WA3K/2d7T0kcdRAcf
         5U3ggtLzek/bBa1Rh+z/F1q4mp73y1yzHsj07A5jRhJIid562gXab8tcXjxohrPW4+iI
         nMoA==
X-Forwarded-Encrypted: i=1; AL+hErG0jZ2pet7MpZjDn4g5LHfzcOp10f8l93PD1PAgGCwo5Fjhrh4GV1OCQEwU2g5Od6oKEjf7C8IjToZ79faq@vger.kernel.org
X-Gm-Message-State: APuU4Z9J9EMvwvuIRTLtG/EIAYY1+HDwVfexkeznn6KcXCc6/npxQGuF
	mGM96HR8JL4RwEBpLxCNKSe+meZQ+kPkmW0qxyJA9w5qP6McUHSy5Lu8L09XbP8OMz0PwBcWXwD
	5DN0yUeJEBrPKQYEmIdHRBZkXBl9d3KaEy6amX44dUDJPS6NWm4jNvDT6jq9Wm/7u9/cWViu3rk
	o2Q/4ZytpWOPPi28qGd2GAhY//b813E0EB9vE/s4wg3Ng=
X-Gm-Gg: AYBFou1gOUQcYhcv2Ng1mld+joeQGozM0NcYX/mRRpuaug7kRDggaz9xjnU3cbLl4Tu
	HyyfZATziFfKjMtQZzoMC1hSOeB3XI3EsBIp1kAA2DDKY1gvuKqTm6E55NpxyVhm9K08vdpJOxf
	b3NV8FXINIdCjyyNMhzTelX3ii/fA9f+lR1hCAyDzolcInRvpo7cwupEEwmA==
X-Received: by 2002:a17:90b:48ce:b0:3ae:5572:c4e2 with SMTP id 98e67ed59e1d1-3b1b0a4e8aemr2984899a91.57.1794592079852;
        Fri, 13 Nov 2026 09:47:59 -0800 (PST)
X-Received: by 2002:a17:90b:48ce:b0:3ae:5572:c4e2 with SMTP id
 98e67ed59e1d1-3b1b0a4e8aemr2984886a91.57.1794592079412; Fri, 13 Nov 2026
 09:47:59 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <ivkwuomer5vsajf2lq6otpgxwqljkwooh3p7e5ne23j37pv22t@iluamo6gxmq3> <20260731131002.142671-1-linux@jaseg.de>
In-Reply-To: <20260731131002.142671-1-linux@jaseg.de>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 18:47:48 +0100
X-Gm-Features: AclHuK_ZuwtIA029trmw5F8DdkesfBzk2SXLciir6o9jwwGKO1CXPCiGSeJhXdk
Message-ID: <CAPx+jO8DKyuNMEKCHyKzw5DS62U2Xu6mcL3BtitRwrYP0gad0A@mail.gmail.com>
Subject: Re: [PATCH v2] pmdomain: core: Wait for device link removals before
 dropping genpd->dev
To: =?UTF-8?Q?Jan_Sebastian_G=C3=B6tte?= <linux@jaseg.de>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, stable@vger.kernel.org,
        Saravana Kannan <saravanak@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: J9wQhyj8vGus8jVdnXizJMNVKsFG7qVG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3MCBTYWx0ZWRfX39CEjuf9f/Tk
 FkHhYo4vaxKSPmhH9wXcwwgXP181stKbgnNFvy8zqrGm6dYLZApypqBmfewzX0X0PRdXGrwMR4W
 y7ZW3VWIjKGw/Nd9YOjHpo6KDv4TvdMfK1sTINxIoSOq3ZA0f93JDh6dSMdzidCbCKKU5E+loHq
 4+ymp/mi9BZqMMlzTU4E1g9THjqlSoU5pwfDnsFH23LTZPmHmeFZkxLZHHU6t7VO533ysWUNZz5
 HnqWt8awLtR8HmEiKzGdI4fHDoiJfYN6QXRGzzPymnxjR/J6cP5aQu4CF0KCPr94Ne0/L2BkF8X
 VunPPWDuJ9uVrL0H4NgA3iROzohkz1VfSaCNfQdM26Ir3uTuFcwy5OeEN9i55gizp8jIHayjMEG
 klnaA9PAjhnDi+qi7Bd1azcKmO8xHDwBxWGerOG/ubcdKMxWU3DllJw8MGMBz5rMzrPt9U3pqWM
 WTMX1mKm2fTz98BxkmQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3MCBTYWx0ZWRfX2AWvSJo7pW6q
 k3kU0PIErgHtfwz0hRzovqrKYu6zs2KFSCGCpHdcv34YOmkLGcjLGTOxkyJVamlqj1GUBnJi1cq
 vN2oKyEfqJ5qRrZupyyga44JKgpe1SU=
X-Authority-Analysis: v=2.4 cv=ddQVTnXe c=1 sm=1 tr=0 ts=6af74d50 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=ShrK26NZXz4ow7qFTikA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: J9wQhyj8vGus8jVdnXizJMNVKsFG7qVG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130070

+ Loic

On Fri, Jul 31, 2026 at 3:10=E2=80=AFPM Jan Sebastian G=C3=B6tte <linux@jas=
eg.de> wrote:
>
> genpd->dev is embedded in struct generic_pm_domain and its release
> function is empty, so providers free the containing genpd with a plain
> kfree() once of_genpd_remove_last() returns, ignoring its refcount.
>
> Since genpd->dev is registered on the genpd provider bus, fw_devlink
> creates device links to it, and those are torn down asynchronously.
> Nothing made genpd_remove() wait for those teardowns, so the provider
> could free the memory backing genpd->dev while the queued workers still
> used it.
>
> This is reachable at boot on qrb2210, where the firmware rejects PC mode
> and psci_cpuidle_domain_probe() removes all the CPU PM domains before
> returning -EPROBE_DEFER. The bug is asymptomatic on defconfig, but shows
> up when enabling KASAN or INIT_ON_FREE_DEFAULT_ON. In some builds, it
> causes the kernel to crash a few hundred ms into the boot.
>
> Call device_link_wait_removal() before dropping the final reference. All
> link removal work is queued from device_del(), via
> device_links_driver_cleanup() and device_links_purge(), which precedes
> genpd_free_data(), and flush_workqueue() waits for it to complete.
>
> Assisted-by: Claude:claude-5-opus
> Fixes: 18a3a510ecfd ("pmdomain: core: Add the genpd->dev to the genpd pro=
vider bus")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jan Sebastian G=C3=B6tte <linux@jaseg.de>

I decided to apply this patch as is, for fixes! Apologize for the delay!

Let's try to come back to this and see if there is a better long term
solution, along the lines of what Saravana suggested.

@Loic, if you have time, can you please have a go and see if $subject
patch solves the problem you are seeing as well [1]?

Kind regards
Uffe

[1]
https://lore.kernel.org/all/20261020-cpuidl-psci-fix-v1-1-d8ab9ac3b56d@oss.=
qualcomm.com/






> ---
> v2: remove this note from the commit text.
>
> Note: This patch was LLM-assisted. I reproduced the issue and tested
> this patch on hardware, and I did my best to verify it by hand. However,
> I'm far from an expert in pmdomain, so YMMV.
>
>  drivers/pmdomain/core.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> index 842c4169e290..4eeb980e5a40 100644
> --- a/drivers/pmdomain/core.c
> +++ b/drivers/pmdomain/core.c
> @@ -2348,6 +2348,9 @@ static int genpd_alloc_data(struct generic_pm_domai=
n *genpd)
>
>  static void genpd_free_data(struct generic_pm_domain *genpd)
>  {
> +       /* Pending device link removals still reference genpd->dev. */
> +       device_link_wait_removal();
> +
>         put_device(&genpd->dev);
>         if (genpd->device_id !=3D -ENXIO)
>                 ida_free(&genpd_ida, genpd->device_id);
> --
> 2.53.0
>
