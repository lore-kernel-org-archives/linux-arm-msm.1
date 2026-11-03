Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793721036;
	b=AWbdxCs0Nny8ERDbSOAOZMW/6R6pA/R9764JEqAz53ocLUyTrYaPj26CgKT19e7UDg1G
	 mHAHC4BmSff/EP/hYGYBp9KsDjyv1yMYJVEzpIsYgWHC/gEKuLyXP4UncNLOdFXJtVtg2
	 XNKshL6zOMi5pBO9N3hEthkSuWRBqsAbqqOH5xILT5LhN1LqaGxc40BN/L9N+DmK2fkgI
	 bTeXllN/uh7DkVC/yJRIEyVT9KvXrztTBlDf9hNRM+DqYxWO9S1Ea4mCrvajN8tqMrvWt
	 gM3CcKxjAQIWimIPHk9svQF9wwXnSr2noXbDjlLXo7Sd4hF4GJfT94VA4N2SrzYD6Ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793721036;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Fl4DtEUu9O1GzMwREKRhMpXvc2dSIaJhC5dKJ95EYE8=;
	b=XyLNRsb97YbyWI2BmIyTF4Y+7/NbzLpx3K1TaoexOxUbeJOdsD4sESmHYC540mDUjWlz
	 bAK7YzdrSyWcjBnXGU5FjdTPWPdUyWXK0KaOR16X0Plv7kq42HJX32c1BHP4PqpEmyZKY
	 9keBz4SyLW6yy0IasA2Qq70c28AoNJd2gjK8YpimxJ8SNhtM38SshBFifyArCL4LHeSjQ
	 avaHouYABY9vuuzPotjTUCS0TqB3svqMgqw+qYzON+CMMkgbxERDU38hub9oNGyax4oCw
	 3e3b2hK7co4wsHcqEDBJFRzLAka9ZYm+5Yo3e3rafM17NMIR62/ZO24B4M2+Sm+qOTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k+YAS6d7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UiCy209G;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A898606A32C
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 15:50:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A898606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k+YAS6d7;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UiCy209G
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3F7Ndq3204625
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 15:50:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Fl4DtEUu9O1GzMwREKRhMpXv
	c2dSIaJhC5dKJ95EYE8=; b=k+YAS6d768yRcuomp1LdPeGGGdr2F0bK6YiGmVfw
	gphONTdleQglPh979nT6DJvvZc5Jqo17MkVD/cJulQeo+YruddWMOEr2ssfJBVKj
	xGN6PBYhZbXsqEzXh+bygQt4/xzPLv765XXqxii0hXAVbByMBNiq40rNiWEX13Ix
	ydAft4kFNs7tFKARSj9gycOEho79fkEvdh8w0RFSy5ScYxiV15KKzoMC3GqqdNUk
	Ca0dysJeWqQ1RfQzww1eafgn3vDe02hXXJoV5fGjJrY+IDXeXsc8hJAw0aXaUkIC
	qG1M5XQaCfEf7txbNpmDzNWpmxURKN0PRLQauHdhqVQH1A==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqhypg8hv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 15:50:34 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7cc48fbca26so680922137.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 07:50:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793721034; x=1794325834; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Fl4DtEUu9O1GzMwREKRhMpXvc2dSIaJhC5dKJ95EYE8=;
        b=UiCy209GdnddhnZZsqx+GaART/XlKXMQd9SaeXP0NLna6diixNLFWznpusU/gi/4dF
         zFAVazfMId8lN3isNc5pYOPYfUhc/G3BfoebgGDNJ8lSm+dnY0SgZQk4vbKPmYtRDzfm
         9vnNLE11Kld/VvjhKdye3GJdJ/jpVtWNzK14NxbIUqJxaT6MXFQfqFk0gr58fC5W5vlm
         x5Jj9AC6nnSPFHJFmSufFLAVWKP+9D1yDUz73Km0OZJKsuOhG5J1xPNx5THuG0I+q7qI
         GGMvt1YxE0QMqmFbOBglz3YsSM99Fx9PbOl2udZxcyKxxz9U/w8VMQzXvyLjV+Tj+vMW
         CNbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793721034; x=1794325834;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fl4DtEUu9O1GzMwREKRhMpXvc2dSIaJhC5dKJ95EYE8=;
        b=yF7eVHhfB/EcsXfQ5yeBj28HycVer4jmgOSopoCe27Zi3yfVhVnD7JctRwP4r/iynw
         1pweLEoGYjjL4pav1g0+Qsxk3vpAtGczw6vncu4z0WRf5NnNzZuUOWV03pHCuw5BGEDG
         peAg64w8fMKNmSHBYTig1eFlJAyNwsWWlw0R8XnzPqxpwRNSdq3N9Wukob2ghjAflLvr
         /e5uyDz+oVqojtFnfpJBKdCFUv5zxcmqYhBBXkHgX/xWc7RjcuUZ2AWI4/Yv42qiszov
         Aum3uV0+GC6KIcxcHrDxBGMuPcz0DAs7nGOH0DT7uR8kaKUHIWp6v47bRW+KrrZDnreF
         /ggw==
X-Forwarded-Encrypted: i=1; AKwUvByweOlv/daYaIm1iRhgmJbQrM+jm2Hp75nrSVoTpYyHLz3Y7NunejnF9OS6/njmBVxgYDdf9WDRpKe9jyPT@vger.kernel.org
X-Gm-Message-State: APuU4Z9VuBXwnjYKH90ZdPRXPtecsDBhPdhuvrP7VINypld8VVICwrvL
	CTw/2ZkjtTGtWwSHfBP6HChcR2E4M9TOmaOV3BHTGHQqgmviMaQJX3MoYoKY3WaCYK2Al1Lu7tF
	n70YNBxKFpjw5ZNL34KalgFamP4pjubtfX1fAfR/FYrNQFlDJUnj9H0NNfS1q4tPqo9+p
X-Gm-Gg: AYBFou1056Yw9Y7mvA6EwM74s/ckYkGYUujB7goaYhVIGvUraSfUD5bfaJ2nhNI0P+t
	Z3JUL2g4lViEMGGt/QCtU+wPfV1w1kUNCtNY2tFuur/pKa9o6ivBmJPhdcdVwjtQXaKRZLblGZr
	Ud9P87eAOcyc9TiiFlOBcEzQhBQfdjOuGHKx7Gwnni8OPIUeVsZgrXjF28mtZSXZArWj7ywUjZv
	cQ0Mr3ZuZRyXqjxyiSn5dPyWuRuJpvE+ZNMqbHUo9T6kNV8/KypCS5eD81Fqu7StYlKzh33rKNr
	E5I7J7ioKhsTxwPmVCUvllxqE2uz2CXGk2debh39Ii4Ma3wL09F65G8A7EwBMBi7OmsK3YSLm5N
	D4GorWwipLfQ0YmBXBgT03zY8pFXCawg5BfEPZ0bu59eBzL28Fh6H1uJOnTyflX0=
X-Received: by 2002:a05:6102:3f8b:b0:7b5:4700:3a6a with SMTP id ada2fe7eead31-7d07267f972mr4897863137.26.1793721033557;
        Tue, 03 Nov 2026 07:50:33 -0800 (PST)
X-Received: by 2002:a05:6102:3f8b:b0:7b5:4700:3a6a with SMTP id ada2fe7eead31-7d07267f972mr4897853137.26.1793721032823;
        Tue, 03 Nov 2026 07:50:32 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b789c6sm27597349f8f.26.2026.11.03.07.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:50:31 -0800 (PST)
Date: Tue, 3 Nov 2026 17:50:30 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Cc: Abel Vesa <abelvesa@kernel.org>,
        David Collins <david.collins@oss.qualcomm.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] spmi: pmic-arb: bound id before using it as the IRQ ID
 field in spec_to_hwirq()
Message-ID: <ggv4lyozt7j37bjtpfxkjch4bicjcj2zk7ltuo46gsabtnqt4b@f2a5vo3gwaqb>
References: <20261103-spmi-pmic-arb-fieldprep-fix-v1-1-405bc58b5565@oss.qualcomm.com>
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
In-Reply-To: <20261103-spmi-pmic-arb-fieldprep-fix-v1-1-405bc58b5565@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA2MyBTYWx0ZWRfX9EDB0n1No5FJ
 KhhUTH6+9R+qPlQsDpU1MwTb0vtp1ppbDGkI1T1qcaLQt0h7TOKuTVNcgLHtF8ER+q9XFt9Woel
 rZxCz7waPwV8voUkTg/rzh8VaXetSZA=
X-Proofpoint-ORIG-GUID: jMteEyDeQ81VUzDNkUgs6MtZAMfkgb_L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA2MyBTYWx0ZWRfX1PwJh8TYbO9G
 gKSSLBDz4S0V53I522Tf8eN25n9aJ4lHDAtgDFlfBx4Y9faB0y54XmnrZmIM0Ttb/OuJ9qIR1Kj
 Xg5uGIg+nN3z2jAawWFRbajD/d7++MXmGDscvdxJ+mVpafqZmo73nj7IUWsVLnWfVV+OoQ/Vjl4
 FOioX+SFoo/BDzXvn3/jLTgP4bsHjR0YKW6Nx+3SXXw9irN+m8A1VJWKgAHI7owuNpfzbo4tXlL
 B651qHPgwJQSiC1/QStLmE7Gk/XeahkXZJNgQntR94jvryBBxlHzmGuocw11R2D768PMj1oz3Vv
 4UJhy3IzbRIwpCWgcCextMsHYq39a1oE4Fy6QF2A1ZxcVwiTQsrQYimyxLudIivwTSVCSO0ALg6
 MZUk+1PJO5vivIiqQHe2TDwjXlRPffjEcQHioOkSnAWe+XIXdZEHJJf189NMBX0vBv414pjAFqN
 NjbPzCYvVBTbRJ2Ky6Q==
X-Proofpoint-GUID: jMteEyDeQ81VUzDNkUgs6MtZAMfkgb_L
X-Authority-Analysis: v=2.4 cv=T94Z3PKQ c=1 sm=1 tr=0 ts=6aea02ca cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=k2Pqr3KV6h0dgAyEibsA:9
 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_03,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1015
 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030063

On 26-11-03 15:35:16, Jishnu Prakash wrote:
> periph_interrupt() derives id from ffs(status) - 1, giving the compiler
> no source-level guarantee that id stays within the 3-bit range of
> HWIRQ_IRQID_MASK before it is passed to spec_to_hwirq()'s
> FIELD_PREP(HWIRQ_IRQID_MASK, id). On targets where ffs() has no native
> instruction and is expanded in software (e.g. MIPS), the expansion's
> internal handling of the "no bit set" case lets some compilers prove id
> is a literal that overflows the field along that path, even though the
> enclosing while (status) loop guarantees it is never taken. This trips
> FIELD_PREP()'s compile-time "value too large for the field" check.
> 
> Clamp id to HWIRQ_IRQID_MASK's width (via FIELD_MAX()) right after
> computing it, so the "no bit set" literal is bounded to the field's max
> value instead of overflowing it.
> 
> Root cause and fix were diagnosed and verified with AI assistance.
> Reviewed and tested by the author.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202610260532.Zb5KDgRE-lkp@intel.com/
> Fixes: 815be38ad8c8 ("spmi: spmi-pmic-arb: add support for PMIC arbiter v8")
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
