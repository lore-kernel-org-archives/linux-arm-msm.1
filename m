Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793931854;
	b=A1BHW8lXvKiUhSYasYMkcO/Vnf/LmrVxGpNlMS3guFbolzkOju39M2orhjD45Nokk3jR
	 eypGsxI1ikXPyrwgDRClmj/VuedNEE5/iZqieop9tOFAZamIfdSNf+SJlp/rNg16cMhAV
	 t/ssUDEt12EdvXXblTChQ2OeXBy1MS6qDuNV9Uniki2KrS5QMhHmDSrzHbf9DyBoEst8V
	 f/yfk15n3CT+mMBgWzbzH6MsECWurB+oDLriip0/KNt8xNUrh0qsRk22YUdF3Xt0jyXsx
	 meum6CdswFyx/GzOTR2kpN0xtvP/IBz+pShF9kqOKNtxEcAXny2CSItj8HAHxq0ApqQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793931854;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7Ugtj1Uw2rabVbTscYaPUmGxT9EXsnqmeQYId8bSE0Q=;
	b=zmegYoBmgvhXtTB+fLRssZvMOy8dc1BqWyOi+2tpjrfl/l/nnwb/TpPjYJ7EQyGHmYNi
	 NbreibmrdiuQ1r4YHxGv5xYeluNaUqHOadYHtrWA+gO52aNDELr9ISbQ94YWVRpIKA3/5
	 gCAGRoAPc9a4ztPD2q6gq4bDNvWkb9FGNwERuOrPF4cXOzsb+nm3AvNjPQCGkdSS4K1zt
	 mRU/kcmxnINDroTTiyJnFOWpc5ZMttb4bNh1pZGivEn4m9x9rmonVIEQVuJBrQtl8oDE+
	 /kMMi41aFXNWd7IX5lcu1W+uyuXbQps8qR/nwg7n6AfK7YQcC9phuet6zCc0q2GN/mw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YTHsjCBr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LY11YBYC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA54606A31B
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 02:24:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DA54606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YTHsjCBr;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LY11YBYC
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5NeQbT3295461
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Nov 2026 02:24:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7Ugtj1Uw2rabVbTscYaPUmGxT9EXsnqmeQYId8bSE0Q=; b=YTHsjCBrSkDAcgcz
	EA2Jc5n25P1pHJr7+FSsz6LnY1GHZChUM6w2OtsA9L9MfpNBl0FvmxzSn0LwHDyC
	9D7b9+2IYUQKzj31PnBpFAdSd1LOaZeyBjlmtHw36CnDpyUVDY1Ein/UQD6l6okn
	9scx2PwUm5n3FofiGdPhTBBDpGCQRZiAt4mt8oiPNLj3kemen9w4gMzitZ8OLWgT
	DZlzmCq9ioddFakz7nigf5kScGHe9R3cjYbu3XFMEOGVgDOtZTRfXXKNmEATZ9Od
	zu+zH1xy9kUe1f/c4b5oNPumIc4dpML4PfzgSuXsFsiqzTzFdsAbsgFIt3Zg8one
	T2OmGQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9rft3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 02:24:13 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ad30487d55so326002a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 18:24:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793931853; cv=none;
        d=google.com; s=arc-20260327;
        b=FuLFYSfpEskLgbt1t9KgUq5b489sOxLtlN5FH9wuU1j9YYbxNCVD5DZRtrW76woRkB
         BpCPGYp/FdXPeX3dY8g4cz69v9FRqWNu5IV6aIgD0Li21an/Yp1xUiKtGHBgzeOhS09J
         sPAq6UsULzRzQnQoFYXSi0JgNVxWwWiDgVKOhmal6mV/d7pHafyt9BiDCXiHesEuNfph
         4ixLRi64GD3Sk62rsiqqSWICLrqbHH4aMm7Qn24AyzubfSXZhmM36Jda8vivFvZezWBP
         y0Q+osPDCR5yvwFYdLkInYb3SdKtwUavZLTq08bb8irFtTzo8ZHF0XxzGyMWRNXQQixC
         rAtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7Ugtj1Uw2rabVbTscYaPUmGxT9EXsnqmeQYId8bSE0Q=;
        fh=UhsihF4n4ZRPb0GZmROjN1M3RpTTDgouD057xAWuvKM=;
        b=gSr42WE30n+mKUDiU8uOL/ODzgS7O+HWCFjZP1ymmMAG7J8d7jeowKZp0s9nZBWfiz
         FSe2zQpSt6MTTGjwF23aErhtl80hrNu00cWu0/UbQNgQikFOQVmUfu4+QeaHcomAqhEN
         qOwzpgJFibn88I9Tt8+/yIZXmtI8DNLwGcIO1ujrtAA1ZRP0AIGuimIe7FzPphgBTRTY
         LeE3Kj9ZK3NBFc+H8oVaZBYZH51xaNnGosYv544HbWO0/Xt1twq6Uo9ZNpHCw3Th6/5V
         FXCgZ8DLfYbXFkgFLBEJYNIZa2Y8G/YmbIhIQBu5miuBAeJFsXoRu9OPjQjE4s5zf9mB
         rZSA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793931853; x=1794536653; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7Ugtj1Uw2rabVbTscYaPUmGxT9EXsnqmeQYId8bSE0Q=;
        b=LY11YBYCeWWof1YFWAWAzfGu+sKDz+EoowTfBNUiGpU2YsdcEom9EPD279Dbyvqkfb
         JD9Qq+f8dgUeSIAkqPWkuCpHeFxA72pOMfrkHrQly3o3LiPge26ao2tWa5+4WBFyZz8J
         CUo+BSF2EfABPozK/IWqWtGf7CUKO+PkGYnrh9hPoM1LJiH/CgCOtRW9OakPGTsyR4WJ
         jTk9wWQ3wp2kFA48sNm3Vz+gwepvaihLkE6f214tDoqWfQnDmGlcKWG+9rHcZZAyZZ1/
         4NtbtZT2qUFo5GNd6JaHUWvjLkxxT3Vcgq+uuAk8j2XUw0sFCZKqrGjXSoMP8hLlQqfM
         A1Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793931853; x=1794536653;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7Ugtj1Uw2rabVbTscYaPUmGxT9EXsnqmeQYId8bSE0Q=;
        b=uX/TAA3QyBaJ4C7aBI/DFRfSSe+PxZFfTXdIwhEhb9fhYbOAoYrNoONzdzcgxqqOEa
         4x9oTbInZI/FM3bj4r+BB/KO/EXvEag3VqwRBkYCCuKv37xb0KWphd8g0HNIRZzjrI83
         Z62LE8soJUZa2qhMpgkmjPKjm4z6gEVDqj6BdDPRimg13iw0j08USjhvkKYRwKaxPN++
         YQZ6KVyPlQxX0a0TzhFwDulLojE7e6M6MaLXOUiVRtiN9KKnBLy+AXyJxvcK4YFSNqRH
         4u62Aw4wTzqKlEsUAgdXa1/1PTj6+cBBtcA0+SOwQUfcoa3AJ0KnUNGJJEGk6pmR7jD3
         KdBA==
X-Forwarded-Encrypted: i=1; AL+hErHU+IhO/kTt4C1A6bFXVMhTHh7U8JfLETEinGDkNvL2SHSjDUn8KR7VKBIpYryE+iemmrannxzBZezpOLdW@vger.kernel.org
X-Gm-Message-State: APuU4Z8HgSEDHO6nC8WWWmgnT3hcyJBpkAePM/hYdyR8EyUDOFLcEJ4I
	Jg/841lY8bZVXhvlmt9u38WEnOb0UioHudlMDgS7/oZFnhA4UDvUj2PWCQk3diyZyBuvvHXgtwr
	HrFwMwGsR4oTPvuZnSSOJoa6lNY/oeOAhuJ2LTy/O1pPrqi2r+fLaar0dnMyR08obIqbtKnwJ7T
	IZ7k4em2dgQXsJT/rpYFAWq1glLjaCvWrEKA223HPVQFs=
X-Gm-Gg: AYBFou3NN5F7LR4xZqzocnDFfKv6NyD7fVEq1NIILaswH2KBomwMBK04XIgPpmJ56kO
	wyvBmDHRVticUBL6Db+fDr2rCQBi0sakUzuYd1xB4oprHmFju/e/Gv5Kkq32W5XWsohNP2rqwtJ
	J157FfctlcOMpvM9y+pJh8qZXo53bJbUd6E3XmvSnfKKyUP+WR8PwLudVMZg==
X-Received: by 2002:a17:90b:5410:b0:3ab:5832:727d with SMTP id 98e67ed59e1d1-3b0db6e7fa8mr1028656a91.35.1793931852762;
        Thu, 05 Nov 2026 18:24:12 -0800 (PST)
X-Received: by 2002:a17:90b:5410:b0:3ab:5832:727d with SMTP id
 98e67ed59e1d1-3b0db6e7fa8mr1028623a91.35.1793931852347; Thu, 05 Nov 2026
 18:24:12 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105101521.434361-1-zhangfei.gao@oss.qualcomm.com> <auyUXp1Fgk2yC7fZ@debian>
In-Reply-To: <auyUXp1Fgk2yC7fZ@debian>
From: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Date: Fri, 6 Nov 2026 10:24:00 +0800
X-Gm-Features: AclHuK9Rpj-OrZYtfA6ZG0BJAkiaIq_2tj00BWz8R6NqylmkPXjbVoBwgnAlwNc
Message-ID: <CAFkd8hu2aLp_MGbT3Lt0wv96sUQ705fBsaa_sn3P1_XUuruKYw@mail.gmail.com>
Subject: Re: [PATCH] PCI: qcom: Power on pwrctrl devices for firmware-managed hosts
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-pci@vger.kernel.org, lpieralisi@kernel.org, kwilczynski@kernel.org,
        robh@kernel.org, bhelgaas@google.com, krishna.chundru@oss.qualcomm.com,
        bartosz.golaszewski@oss.qualcomm.com, deepti.jaggi@oss.qualcomm.com,
        yadu.mg@oss.qualcomm.com, shengchao.guo@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAwOSBTYWx0ZWRfX1Psp6MyX/btK
 OT4u9gu59HESAoeoY6XiCkkAcF1oaMJISzbNvxzA+qdztK0htKx5otjdC/jyBVjQoEnTvgJOax+
 0rJzps8eX/MdEcz8SIkkajQ509+uGyA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAwOSBTYWx0ZWRfX9ixd/BUpfEcc
 iIBsPYZOXOLDrf0PYXJruAvIOSftP9Sxi+5yMu17seaOuPb3lOF7Vpd41SItw4UXK5KYUpgdFTo
 utHAKUfL835kPMROVuQd+ETxjCOgQtvLwbKkng/wB4wNWFxD3PxhF0/pdVfw/E2Pxf3n87adeU7
 HoUbiVG8k3mIW8Gfsfn45LYMXUCQIYzNCowGgLs2OWq4eGwxDJlLeyWTDsuR0KcwNWh4Su7I470
 eO15P0FYB7WKAKhEMT1C9TEVctepBkpXausQH+tJporSKxrWp9kQQdDLfoF8XTLQ/+k4qL/n3WV
 q7ho4JjeklkCQhGQ4u/3BhBRepsv9byNGMVaC5TbS3A1vO1/PUBSqWIR968ZKc1PYwJ/IqIWsBn
 0ald5HqRam8pMPCV/WN7tjLcBhYbIcCWK0CYxnJIEzEMl3NoAMGS5Y43Ul77AtYca2HK52AsuUj
 VmjLAvWQp46VAoK4ilw==
X-Proofpoint-ORIG-GUID: U_zMdThJM26Mc643D73di3s_TIoxqO7z
X-Authority-Analysis: v=2.4 cv=f6Pdl+yM c=1 sm=1 tr=0 ts=6aed3a4d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8 a=zdetyYl-RAO8K0uE0e8A:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: U_zMdThJM26Mc643D73di3s_TIoxqO7z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_06,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0
 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060009

On Thu, Nov 5, 2026 at 10:37=E2=80=AFPM Manivannan Sadhasivam <mani@kernel.=
org> wrote:
>
> On Thu, Nov 05, 2026 at 06:15:21PM +0800, Zhangfei Gao wrote:
> > commit b921aa3f8dec ("PCI/pwrctrl: Switch to pwrctrl create, power
> > on/off, destroy APIs") switched PCI pwrctrl users to explicit create an=
d
> > power control APIs, but only added the calls to the regular DesignWare
> > host initialization path.
> >
> > Firmware-managed hosts bypass that path and probe the ECAM host bridge
> > directly. Endpoints already powered by firmware, such as NVMe devices,
> > remain discoverable. Endpoints that rely on Linux pwrctrl and pwrseq,
> > such as WCN7850, remain powered off and cannot be discovered.
> >
>
> NACK. For FW initialized platforms, FW should power on the Endpoints befo=
re
> booting Linux.

Thanks Mani for the clarification.

  To confirm, for a firmware-initialized PCIe host, is the platform
  firmware expected to perform the complete board-level Endpoint power
  sequence as well, rather than only initializing the PCIe controller?

  On this platform, WCN7850 requires PMAU0102-E GPIOs 6/7/8 to enable its
  power rails and GPIO10 for WLAN_EN. Should firmware assert these GPIOs
  before Linux probes the ECAM host bridge and keep the Endpoint powered,
  including across suspend/resume as appropriate?

  If so, we will drop this driver change and coordinate the required
  platform firmware update.

Thanks
