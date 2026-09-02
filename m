Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F0C1ABED9
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Sep 2026 07:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788335561; cv=none; b=jXJugLHwdwwyOC5qEi5H9cqWFDCrwGF4oz6+vhCvNOp/Pr32sW0YyqA0ajYeTERaI4uKTUSmyqTb/8RrD86G68nMU74mBy3z2TSJ+RuFE692nyqvzuRo2XvGCfPL39GSdinpUZRxpCCQiCyChLiy4BhXnXQmTP/+CcPM/rIqdl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788335561; c=relaxed/simple;
	bh=vS/n6FpRvsfmcwxTkH9S/ll+Yj5BUUp5Nnnp42lgrTs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AX1qBIjYx7ewubNqnt31bsVIoySQ53/aFblmKS4lczX6wtzRVycySTSSYIVQB1HwjN0i47rN+2y9WVrDP3G6cCgbjDol83j4J4V9TvS9CROV5L0uwCBOezbSQeRj/H2nUXrandvB/qSlkR66SjSiz3DbMbYY/jG+Qebgm++x34Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jTy54Byw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GGeolsm1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jTy54Byw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GGeolsm1"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6826VY4m1859323
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Sep 2026 07:52:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wzl3ufzAnU4HEYD54uRhJuX7P8cpp0TpUhmprYF889o=; b=jTy54BywqPTSFTKc
	e10Qd5SSwa9PnvhTAt1zP1ZQkTHhlG6wPONubZB4v6pvi83tQIvJsJosNTTjsYd0
	mZmaeefAc6KB8nKYtcCVjsyQuZb7nP1/pNgulX5vZcBCc9HGvTso/tOIPAmd+kKF
	KW/tZPufHJACpn+wID9h/eKFaMhMfZDiZncxeBvA17kTOYD5l5EYjnpIbjlAudbW
	2dl5ORNL/ZG83GGhOqa4/5ZUbUjavBDF9xRu+cIlNhMlbyI60Ospx5C+IiALoiOI
	N7N5haY+5kg4ueqbph1lGUMAIGXCaE9SeBqiStfqpgP6pdnq0yOwLejysdLh32R5
	3b4FSg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge8whhf58-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 07:52:37 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d932ef41c4so12167655ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 00:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788335556; x=1788940356; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wzl3ufzAnU4HEYD54uRhJuX7P8cpp0TpUhmprYF889o=;
        b=GGeolsm1BCZ9IBJgiv+7sv8cHwR/Ij7ukEERws7/6nuQVotcbOoTUfbc4rAcBgRza8
         Uf9+sNZ28J81eOqisn1jCOQMbpbm3Rqc7ucPYuVevbDBfAYjZqx6DGSqXUJdDSEjzdlv
         9HJafe6jlo54IXGyWkQpe10AeatmHh4W8ljSKl7Ts32zgY8jsBhh9By0+x4dgQHjEodP
         E74k2qcrhOFL6SjJb4fOjkqPlJhR/pzoYN2N1mxYo0ZlKqv8K2hywXGPoY2VXcVmzhLH
         PnEcJek0Gpole1mdvBlJGf8BrnQHxG8MxNTTAjGsxK+mujoZj5P8XSy1MACNSDsJSGti
         gjpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788335556; x=1788940356;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wzl3ufzAnU4HEYD54uRhJuX7P8cpp0TpUhmprYF889o=;
        b=fmaKXKnUeve/7Tk8I4uN/20fU32LaHECa5YmSRJ9R0CUaRaZzNyn/R0thxfpWJRMtc
         55DUFuyzL8NYPa3+Se3lqjMJcBLfeSE5vhgtaPezQ/j+M2lFqbG1Wze7cqlhAc56JKkB
         X3+Zx2l9pN1TUXNy1TqTxUdUfwS0K0i+p2sXdZ7ZiWKNMgEskNppfiFBk0WNQlUr6Sva
         8GQTx5lazzgWYUnjxFVgN2/JfvbE/sbKuPh0/PtpF56cDtuGE4O7R8PA/UwdIlWccQqB
         UtZ+J0xBj337zKk/VOG9Gow83uKQRxGY6eUjBqZ5vL0YM9NPhlZFshA+h5MUBkq3MPhG
         IbbA==
X-Forwarded-Encrypted: i=1; AKwUvBwOXvloB0wp0uLp55UrsbjI49Ja3gKEEGFb2HthP/0+RKNY1EURaoR9J4R12ayZaO2Ag6xLIizk8SP5Vak+@vger.kernel.org
X-Gm-Message-State: AFuF++lqmfVba1+6VpUnOOu5pI9ZRDXGndVOavlXaVZ7WjM8wkI4pF9F
	Dwbid/rgeH2lRzX1ogogBCjKEF0ckcXMmCWF1DNfZCtKSmW9ZN7KiPwbS5N6H1w3zuG+mYdBC7h
	mLlL/TZ5ykGKQmKKPp14Z3XB0l6vC846RcsQorAWaTmW/Ry3HLiGtYjypkt/c2Vgp73uw
X-Gm-Gg: AYBFou0dRrJN/wd4rUjQrKhsR+ml8/o17tdkJYiE4oxD7IUhsYquVYklxkd6BH9qrp9
	Y6H7J78rwLU0DepZkLK5EeXtMPM5KPJL3KeJPbpKdnMDhUlFJGMES3l1UI4XNrUtxxwdG2+Deii
	eZVBVvPecqNPQ9vdptW549dF5uMKbD8mNC3wrKqv9LgVrzByl6pElJgsCxtuSLKY+cjqUO+S+O+
	Bx02324cPFf33/iyqGEJdSctRMCgXh4qQg7XdF4Rxr0mykYKBQ0UogsPS1hmr63qbYxyh9FlaFp
	ebiYwYl6XObu7HeQ96LbnTUBzb263jRHzA+TQh4cy5l8JamBJ7CvNG7kTwHafEBGzg/RNTPsUNo
	+xUD8f752xCvRd9spiQublXwymQQuMa2pTvcFGtF5pIg=
X-Received: by 2002:a17:903:230b:b0:2d9:2ff6:246e with SMTP id d9443c01a7336-2daf13b31d8mr10641775ad.23.1788335556363;
        Wed, 02 Sep 2026 00:52:36 -0700 (PDT)
X-Received: by 2002:a17:903:230b:b0:2d9:2ff6:246e with SMTP id d9443c01a7336-2daf13b31d8mr10641525ad.23.1788335555939;
        Wed, 02 Sep 2026 00:52:35 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32f07b79898sm5004359eec.15.2026.09.02.00.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 00:52:35 -0700 (PDT)
Date: Wed, 2 Sep 2026 15:52:29 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Add NMXC power domain for Nord SoC
Message-ID: <apfVvXLAW0j7g3pD@QCOM-aGQu4IUr3Y>
References: <20260826135454.658615-1-shengchao.guo@oss.qualcomm.com>
 <CAPx+jO8RVUv=mqDZ-GeJa=dEYdNCK9L8Vi=UCDY9GqQ1TefCsQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPx+jO8RVUv=mqDZ-GeJa=dEYdNCK9L8Vi=UCDY9GqQ1TefCsQ@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=fLkJG5ae c=1 sm=1 tr=0 ts=6a97d5c5 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=aF_vd5NMXLjnXWj9f7cA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: EIhSlvdu3OXvQiuhcgDhIMiHnEhH8wS8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA2OSBTYWx0ZWRfXx0Fgi7B085EZ
 lShZmK3TVXz+kRNlIbdJHstn7ur5CBYjkqRUmRQjVlj5c3lqwV4UVmTtUcD/08fdbt3iB1hwtgJ
 6VSpaeo5fhq5muHhUHRA0cAasxbJaLKFSS/S0TYglqx2FYdI4hIpShW2kqyL0vRF7UeyYz2XihL
 MqM7yHA2gfnqdG5jcTcRtU8wyin8J9JaNQHY1jJgMEIU/AGo3R7uyTa+LVw3dv21d4kWgrFpRH/
 cF6mdfp/y1LqY7IKJlt6xHrwsHERBT1nS6yaVpKemGg1m81CJp744IpWbYss8ENIAYX2qC2FaPq
 eueNAMe70Oh17cfUk9QH7+itOX0jy2Gkednah4gtbU5CZiFNgkdxblHHOicXmYP/JoR0mgZilnm
 K2TH4KiSy7U+DcQI7zKOlH9rjtwQ3R+8UFoBCK+h+Es7Sv/WQUAXrqER6inXjhznwjKY0kEHMYX
 l7+5ktO6pfhKbd9DyVA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA2OSBTYWx0ZWRfX5jmmy/2pXxuE
 pF/Myt43qNHiKW3lVm9EJ3VSJkCZvgYX0wAsE1Jh/yml3DFAPkZrDo2oX8/hKzALhU0PuxnRku6
 KXeb8GprS2nTPJWxIj+p38ukquUqTtI=
X-Proofpoint-GUID: EIhSlvdu3OXvQiuhcgDhIMiHnEhH8wS8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_01,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020069

On Tue, Sep 01, 2026 at 05:46:09PM +0200, Ulf Hansson wrote:
> On Wed, Aug 26, 2026 at 3:55 PM Shawn Guo
> <shengchao.guo@oss.qualcomm.com> wrote:
> >
> > The Nord CDSP subsystems do not take their memory rail from the shared
> > MX rail like all other Qualcomm SoCs, but from a dedicated NMXC RPMh
> > resource. Add the nmxc.lvl RPMh resource and register it in the Nord
> > power domain table.
> >
> > Changes for v2:
> > - Drop remoteproc changes since "mx" of remoteproc is just the name of
> >   memory rail input which can be wired up to NMXC power domain in DT
> > - Link to v1: https://lore.kernel.org/all/20260826102746.633076-1-shengchao.guo@oss.qualcomm.com/
> >
> > Anurag Pateriya (2):
> >   dt-bindings: power: qcom,rpmhpd: Add NMXC power domain index
> >   pmdomain: qcom: rpmhpd: Add NMXC power domain for Nord
> >
> >  drivers/pmdomain/qcom/rpmhpd.c          | 6 ++++++
> >  include/dt-bindings/power/qcom,rpmhpd.h | 1 +
> >  2 files changed, 7 insertions(+)
> >
> 
> Applied for next, thanks!

Thank you, Ulf!

Could you maintain a immutable branch for qcom,rpmhpd.h patch? I have
dependant DTS patches planned, so an immutable branch would help Bjorn
to resolve the dependency.

Shawn
