Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793615516;
	b=JVqLwn+YRPwNmzZsTs02R3unu4N115MG3m9GXLur5Fzd5g9r8rQ12NPhnnqpGqe3VX4X
	 3jYtjSnILAmfoeSHzUXl5+uODpP7ViHroXRkVjkR8utUV+2haLVE3KUtaqQ5qSeO9i/ij
	 HzMjlqDW+yxO8kSURxGqEzoNZxUWG3XhYEXsPvyWMYCA4Yu5fS5610R+3b0/hQxzYFtWu
	 NZ1O5Fhftr35RUbEBEo9p0pnViGysN3L4d1Qtz86ak0BUGnBcXcMEeaYwil8UBA+s5+HI
	 2iy4gyus+msCETBhyRdKKB5s6aCbahqR08d3s3j6CRNaauQqIcpgdEGbDm5ugUWYnwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793615516;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=uyXnqQWcaQLaj3tsaPz7FL4nVEjagE+Vxk26KQ/sNaU=;
	b=gJcEHG9FWIi6/3bAiBqniqabu/TSUXMX2pYW79K4/R9O2B3RgLPgt5zJ8JkyAPdwBlo8
	 MK8Ngv9z4lDdMm6pf7n/PbKE+lkbTWYGGFcJyKznb+uNEVOuRtTZTxhWmMho2CDq9+jyL
	 Udu+ye5zM/ErxpM+3rWAifiThO4MOrkn0HG00xdu7cwfbiTwvjedoCDjm/Jpf/3ZGdI82
	 hSHJJM8tN+tnPjT3nGWfDjt/eCPI5Otx9zq4ps2074AhIGUG5933QVIroCHtaZsFTQ/GQ
	 uq4bYeIlRTTO3F6H/BCmCn/D8Z/CJSWsKGgusO4J0Qh9xnUAPbQsfW48i/6qhuWp2wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CwHYaScC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kKBEKybM;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D948606A329
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 10:31:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D948606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CwHYaScC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kKBEKybM
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AOc43086536
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 10:31:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uyXnqQWcaQLaj3tsaPz7FL4n
	VEjagE+Vxk26KQ/sNaU=; b=CwHYaScCqnAktnLKbwefXAtcrQfw7DQxwntVIy4X
	aEg+V7GMxxJOVyNCMXFNgjoaC2UFXe9b26BiGb3/NQvylRFsZpwICCI3rQlWPqmL
	or1c4wrz0UcGTrI12QXfkujgHzJFf9P6r48vz7VaZ0FFr9PGge/W34hpgqZZ4UcF
	uxat+c5kD59iSk/jEbpIzD7Qjd+1nscDkDvADZM1c/mJQeYK8AFWF0sDsBgkwTjX
	/H7j9zlkVgcFk6N7q7ykac08RHUUEjEUr4PiSN5qrk7p+B3UwM+K4xEWlqz3mw2t
	UP0Ekpeu6LuloBMYLzBWTyHgIAKPLy2h5J0ICCrsNZh6Fw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpka61bwq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 10:31:54 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f13c143c8so520786985a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 02:31:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793615514; x=1794220314; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uyXnqQWcaQLaj3tsaPz7FL4nVEjagE+Vxk26KQ/sNaU=;
        b=kKBEKybMJJYWp6+wtf8NSp3eNTZ3ybd5ZS9dsuvhyikhgdfcwvo9BB/Nt1jREfn+1K
         sqzVx3C5NqDdaJe7z3SDnZisaRUGn53e1goDptvM9Ya5Ny63RlknGKNoSLtSiDVHp52U
         EgewAshOrkHnAehM0dCt+i+EhIzcLDWTxBMrbVQUC8uj6JsrHkGd+8r4W5/7rhocrc9j
         GxPBtblIm1hfbIKUBJkt4G5xoZvefp+oFX72dfUwZB2QuXlXbQvOGlMUoj3Ashs2+ij6
         wWuFMTIvCLurUhXEHVAfCLymnHWq+XXjx85Amnmmra/WIWFgBOecuRUqWh+gVdF/CMcw
         h+rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793615514; x=1794220314;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uyXnqQWcaQLaj3tsaPz7FL4nVEjagE+Vxk26KQ/sNaU=;
        b=wjO2zA8bA9yUGcpC8kQBDWpgA124TXcLC18IzYhw2NYqzEbq9um7VsKB0dyusQiIqL
         rtusCkI0ShMupw0LkY/hyR+auP5tEV+ZFvJkBvB6CGnxlkmib33mn/xT5gAm4Pcb8dsv
         ZORCsWYutRBNNQXqIfqJfAEJErtTGqrk0uc+etszMP0L/bqFodlPheKJv9FHa47c4dM8
         awVzxaAUl7/GTJ3oQDt+45qQmtawnuJoyziwjpdi2CN8RbkOIxZa1vbUQuwjrYsi7elm
         azdUTPyfE403yONKenbibfavZpfWAuENF3vQ3/NgBXLUZSb54lDLZrqd6lu0turgKFst
         Hqnw==
X-Forwarded-Encrypted: i=1; AKwUvBxKeqcV/oLqELhzF8siGDJLB47AhU0EddZa+1OLsQnWWRNUQjRXAt+I8Gdo15hygmvZ+UvV5e82OlSrkwnD@vger.kernel.org
X-Gm-Message-State: AFq9FYLlSbMFRFpbh9fn6vCADBfo9rqNPQZ0R2JI5lOEWqE33fUNvMIk
	ACQ65MNqWNdUsPR3C7yl//6n5uNyGUfLcALyG9hiupLkQQYKqOn88ULaQ5Ikf9eSNKqs/LTXxM4
	QDknrzR8MUgZW+Dm+KATkqIPjSdwYpgqrkZqTjQNd0ki+yIy/3N5MTcY8r1C7JQhn2g85
X-Gm-Gg: AYBFou1UEJVvPUJ6H0BtsX1TMz1EtMgvUp29vVmO5FOw7+/rbeqJkREXPcRjgmjz1BK
	Ixc3aysDeXfFyv1SxcbxNVLlPZEFx+razaHhPZL72fgZ+ZVS6xKeAOSLiq3yDSQDOkySjdqdUd0
	v/65+J6643WJawjB40jSS1XdSjh7TE/gBYdg2V1O2ZD2VwwmMs9VkHHsZfPbO3VQwSMaLRCuCVg
	mTSEsWMS+eI2IWsaHC3MzE0eiVKGQCgjmb6WKzvjBqbASEC3LxQWvhUAk3iVxQHEHgSOmDIWDA8
	+m88xzmLwv05zaoiIoihegYx98knKUPnnLCkRX+q2vkLPkT/AFvqxpjyoaPe+FjtuLsNrev8azE
	gY2pmCKlGl7uLPp/bSZoCAz3LSMso9PbeGpkDtxrX7mo/rjbKI8ojpGkwwPWcT64ppjvLEJ4wnZ
	MrCVelAJgLuGjUiaOoAYxVpL4aSUkzC0HaN0El+tOKHYk2IFqKjwXPV0KmE5Op
X-Received: by 2002:a05:620a:a888:20b0:944:2201:2770 with SMTP id af79cd13be357-9442201292emr1020059185a.39.1793615513929;
        Mon, 02 Nov 2026 02:31:53 -0800 (PST)
X-Received: by 2002:a05:620a:a888:20b0:944:2201:2770 with SMTP id af79cd13be357-9442201292emr1020056385a.39.1793615513478;
        Mon, 02 Nov 2026 02:31:53 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acd1145963sm3142181fa.37.2026.11.02.02.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:31:52 -0800 (PST)
Date: Mon, 2 Nov 2026 12:31:50 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: "Gjorgji Rosikopulos (Consultant)" <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, bod@kernel.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        loic.poulain@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/3] arm64: dts: qcom: sm8250: Add JPEG encoder node
Message-ID: <tshclix3kzs4iwgfxjrj46o6vebelntyikhthqwfpoi6muyckr@lhaix6uban63>
References: <20260730150524.2659577-1-atanas.filipov@oss.qualcomm.com>
 <20260730150524.2659577-4-atanas.filipov@oss.qualcomm.com>
 <ln6tr2vwv6zmoo3kcivjjf3rqjxqm2fltwcpn4kk3iphc4rzlb@qdpop32fjm5l>
 <ce631db2-8e8b-4b97-8164-c701a1b0dc1c@oss.qualcomm.com>
 <2rtrk7tsquxekqhk7tsiomjnfzc3xfqg574cbw2m5b4ui4ovt6@2oxme5w4wsqy>
 <31db3de6-34a2-4ccb-af61-043f56d8f86b@oss.qualcomm.com>
 <4f7tyzvt2ojfmkneoaviegk3xbt2gegp3yoei57rzijcxkrlyp@b32nycxqybyj>
 <20261102092828.3728247-1-atanas.filipov@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102092828.3728247-1-atanas.filipov@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: rDzT3qt68t-wXGOYU10BmTLdlYWxWqRm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0MSBTYWx0ZWRfXxcY9z+N7YaBI
 pBLCZQiotqYB14lyIYpvfUFVeeityXzcSjaGPKU/a+RFCt6ApTEWOrq1tV7W2LqgmIcSuEfSocd
 MOcOrD7ipOTHg5yVe2suB8n1E8Ruvsg=
X-Authority-Analysis: v=2.4 cv=ZbyIpcVA c=1 sm=1 tr=0 ts=6ae8669a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=bJwWMc3u49Mdhy3934kA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0MSBTYWx0ZWRfXw+1RvlmAZQ14
 n+pxDhHMJV2n7QIIWSMPTs/aZJqgOh5dvUGyTIORRgJPQMiGUuxOL60koXRTLTlo9J4twokz1Gr
 xE70WppbQdlLlTsNfNR4mMcXdPeV8FIdJNiLpYK67hN6NnwMEm6OvmvLkefaTWBSK98feVzWG0P
 oUtiIEIBL0GurgP5EG/WubE3bQ8CCaOZRrb52SDnssywpggDTFHNG9bK7XysKYfz/B3UBYIeqze
 En8Fg5/+dz5yB4h0tr7PQhFTk9dlwo0iG7N84XmYgLktxki+1p62x1Rgg+Os6hn7WGXf7tRrldE
 ViRCoQshcOkEcGoaOprERgzDjyseAjQEtC8DMWdQ5G3Tc0vHoISxI8UOGgCfEu8j1XTORMSFON2
 xdt1wFDo88r99i+im+hWYy6I9UMAw39VBHaD7jjysGTmN7k5ktLstFtNWNE9p4O0W7acRdT2N53
 UlhjD2aaBKbVC/BHw3Q==
X-Proofpoint-GUID: rDzT3qt68t-wXGOYU10BmTLdlYWxWqRm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 phishscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020041

On Mon, Nov 02, 2026 at 11:28:28AM +0200, Atanas Filipov wrote:
> On Fri, Aug 21, 2026 at 12:36:26AM +0300, Dmitry Baryshkov wrote:
> > This will be true if:
> > - MMCX is a parent of the TITAN_TOP_GDSC (in Linux kernel)
> > - the driver casts the vote on the TITAN_TOP_GDSC using the opp tables.
> 
> Both hold for v7:
> 
>  - camcc-sm8250 attaches MMCX and registers TITAN_TOP_GDSC as its
>    subdomain, so a performance state set on TITAN_TOP_GDSC reaches
>    MMCX unchanged.
>  - v7 adds required-opps to every JPEG OPP entry (min_svs to turbo),
>    so dev_pm_opp_set_rate() votes the MMCX level through the single
>    TITAN_TOP_GDSC power domain.
> 
> > Checking the 4.19 kernel. cam_cc_jpeg_clk_src casts votes on the vdd_mm
> > (MMCX) power domain, while its parents (pll0, pll2) cast votes on
> > vdd_mx (MX) power domain. Note, that frequencies used by those clocks do
> > not match, so we need separate entries at each of the corners.
> 
> Agreed that the PLLs need MX. Upstream nothing votes MX for them
> today: the camcc-sm8250 binding and DT describe MMCX only, and the
> rpmhpd MMCX domain on SM8250 has no MX parent. On SM8450 and later
> the camcc node carries MXC next to MMCX.
> 
> Since MX feeds the camcc PLLs, which every camera consumer shares, I
> think that vote belongs to the camcc-sm8250 clock controller rather
> than to the jpeg-encoder node, so v7 keeps TITAN_TOP_GDSC as the only
> power domain of the JPEG node. Does that work for you?

Konrad started to work on that part, but currently all the votes belong
to the consumers, which means that end-devices should also vote on the
MX (e.g. see Iris devices).

-- 
With best wishes
Dmitry
