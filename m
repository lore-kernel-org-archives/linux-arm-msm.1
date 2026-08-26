Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40973299922
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 03:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787714335; cv=none; b=gc+I5CIh7sh1+om/KWSyFtmBtXsBxIIfQHn1BuYucNk3jEFSA69IyCukmKsBbSaVjUXpcJx/CHFEYiwCmve0OTRcRIUd/vToWhrBJawzu3uRCrGIkb+V2xS2bV1znK0T0pKhKy2vgS5kguabTkssZZ5J56qMH6CvvrSXBvEIWMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787714335; c=relaxed/simple;
	bh=mViQhBv9Io1wKUsVU4M2w5Iku9EsAue2Mbo3ELpm93I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PQn+yzoeCswHh+brywjcT58wey6Unc0ToqyyAC/SxrBOlwBG+mao57W6UPRbAeLoydyOROCRq+MuhNsu0JIozLi3/YBXAJNqaM0i3sDxlAhwRWuTHzXdq5ba8RD6sgwqoTCzv0q6K6hxydyT4/kARjp3fjD6DkRsJdMgs0nfd8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Th5GLWzs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LTH1GESZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Th5GLWzs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LTH1GESZ"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q3HUqW2705810
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 03:18:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZUIYAbbI0PQ2rPV+8Y0oOuMg
	GdJMz2un1mMUt72E1EY=; b=Th5GLWzsnn+IqCdRXiEH3rw4Se6lZXWmMeh/7slz
	cKtLjgNoTgRIwONH+XD3Zl6T/BkYilIaouYOHQoPNA7vobAg9cUyr7eC8hZQgVAH
	eWb9FNZX7jK70Q/YnRMbWOShTb63es8iLynKfJXxRrYc8c/CgGJVyAItvUQgz1d3
	tLQJr/HeZZZG4eaQIRLXM9kh/HTEoemaO3HgSzl0tr9cUgm3dmisNS5vpfu6E8vO
	4bCUuaXGnqCBC8aA7Rf/HXR+CG1yyPEfN1o+nY1FjEKCi/vnYaR6BPcC+0FRIYB4
	hGxL6KUEami98e9Zjl0q3xbTQq8JJ04TzMrmVh5ukDJryg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9f9ussk4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 03:18:52 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-388cfc4848dso576645a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 20:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787714332; x=1788319132; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZUIYAbbI0PQ2rPV+8Y0oOuMgGdJMz2un1mMUt72E1EY=;
        b=LTH1GESZC/s5FWjL7wHEK7zPYt36xwhtjplWbfnyhGCuY9QKA5d0Qq8HZep3d/Mfdw
         ZPUyr7D41ACt6pOlijgZ0eBQeQT5/Y3649i0NKrttOFRBGbe0UKiD0q8QQe/Yfs5jMM/
         fVyx2HNcUk8a7C/7XIfhh7Ei2oa3pcDTC7EAOQjmptxh8OKUq0/+PW38wGFBeZTtkrHR
         Gf6X976cYKXsu8rXLfyYnNHvAGLVxHQZ2EnKpct638DBgniUNTfjp7SNLSu15QgdpTk1
         rfqRv9u3LlA+vU+v3kjKKzkjVK/6zcb5LgH/+mz9X/uHuEFnm9dzz+IPm6r0bgpsRRJI
         pIkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787714332; x=1788319132;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZUIYAbbI0PQ2rPV+8Y0oOuMgGdJMz2un1mMUt72E1EY=;
        b=hSR+CM3w0g5WjEgkQHCmONKmhCkGA4tc6XQNZocqTQuqDygSGAYVbhNsCqMlqQ169y
         KT3BRgaJ2+2ac7YjnGFygbcV+F6hxlr99/JeeWqRuxFDgXFb2uHZv++OAd/Vk/lpzrAn
         nScZfIsbsvHx7ieuMTw5aEv1ScJUfMyv7E+jMgIuPSPKLr4Aqy1qe4lJOzma50SwvaDJ
         2aotymRPqW/xVMggYidYEhxqoOzQSWV/AIPhHwx/9CD0qW7sxUlayJQscqbegQ7clN2A
         EBlMRqukEiT0/z4vG6zY4RWuw7hoJUgA8+WlXZGTWueYMDLROykSYN3RaoMIfJK7i2nH
         uVVw==
X-Forwarded-Encrypted: i=1; AHgh+RolwKj0xhCbkvzrzjfw6cAehEDwIp0o/kPspfVwdLcZOUYJ/4LkQBkpxYugmqjTYO1kTFmzGdiKz7cILRnY@vger.kernel.org
X-Gm-Message-State: AFuF++kSx5/oXC0RQXbhoEfmi5huOkz6r1Mq1xL26JTv03lIZoLmtbVU
	bhTh1z4ArWt9KudS6pszUOl73gNqtZCeChyRrOR6oGWrpyZ8QvtkOMwXbz3DGNg7CmHSj4aYNZy
	38wMX2oNwo4OR/20BgpU3CU0uryK3C8rPlhBfcFlm4RR2ItNgC+bftWhqQn/eogtLC9MO
X-Gm-Gg: AR+sD10NZooZmJcqLjnjqGnaUysRKC0z/89SK1xczPqkIeIsxFMS8Zu+6onlOUfAsh4
	4iYCcaS8wnYfOCwZzP+dqvHja7U6C2EA50pRdbkOEGw5Oq85x4/xq+VPvENIuOIVsbDmA5bslG6
	cqYsutTZS+h5oKrMDg5X1feJymLPrPOMc1smbULwnniKTWdXSVsdf5FgyZVFxcRXdC5D6LWo4aD
	RtvpczvttEfMsQPa7qDpm3WEF/9FIYxaKDR+bqweAdOxI4Sqgy8S+eRYK9QJ528/SW+Rw96LKJZ
	uhiItYx8hUcE1zwXRTXIhiStbO/miVlZLN8rA3ljVou13Jp/p6oBbBiXVxb59j2hSXv4bGgTjjh
	pp1l8Ppgy5Og67/VnMZ4uzbkUn4f7XeMSiT3jpSkhiWI=
X-Received: by 2002:a17:90b:3890:b0:395:bbfe:fc6f with SMTP id 98e67ed59e1d1-3966d401db6mr7594136a91.3.1787714331958;
        Tue, 25 Aug 2026 20:18:51 -0700 (PDT)
X-Received: by 2002:a17:90b:3890:b0:395:bbfe:fc6f with SMTP id 98e67ed59e1d1-3966d401db6mr7594070a91.3.1787714331567;
        Tue, 25 Aug 2026 20:18:51 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d885fb6sm3670178eec.14.2026.08.25.20.18.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 20:18:51 -0700 (PDT)
Date: Wed, 26 Aug 2026 11:18:45 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/8] remoteproc: qcom: pas: Track HPASS ADSP cluster
 membership
Message-ID: <ao5bFTVQM1q9P8E5@QCOM-aGQu4IUr3Y>
References: <20260815132541.1575121-1-shengchao.guo@oss.qualcomm.com>
 <20260815132541.1575121-6-shengchao.guo@oss.qualcomm.com>
 <1699019c-510c-4658-843d-e1ecd7364c5b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1699019c-510c-4658-843d-e1ecd7364c5b@oss.qualcomm.com>
X-Proofpoint-GUID: nFQMPfmyPGKLKd20hu7QBqB_RLAWQFad
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDAyNCBTYWx0ZWRfX3A2bMr2wLEBz
 jIkq93Xg8dKIEUPCZ3COgsV3K0AaeKelU8fcBxxOpJKBl6gyQacy0yc1cIcCpGlyJZ+zzb1FW4K
 pQ2vEJlZdunWHL+7W4u7YU6gIRxpja2aQGKRLMWzZeOma+axYQ+iGCrB0d+pwFE54VElWs4e9it
 BQKcf81VpZP2nn09yDvX8OGww4LxCqw+Zi2Cs82exTPiaZztEHzcK0ECbsu7/Gd4gQ1/SEe0mJi
 iUzeyhtGu/dC5KShLONY8+o+iPdaZuBcxVkRKJ2nf0xejG+J5vwn0mTn6ZR2th74CEqVAFZNoB6
 BnpBgBol4UMAWXObzuCMRcQ7sOMV2tsxnp2i/fpvLiemeLQv/Y4iPfMPNlRx67eVIp/6BENbNGy
 koxb3gN71tEmVf/lAnPxTulWBPICIjb4gxqEg/d+MHdoDxj+CyzB9jsLgFg0fVs4w1IRY0zpX9J
 OQQIEc8lAjx/zUorS9g==
X-Authority-Analysis: v=2.4 cv=acNRWxot c=1 sm=1 tr=0 ts=6a8e5b1c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=NRRTt12i9hMZvaXXc5UA:9 a=CjuIK1q_8ugA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDAyNCBTYWx0ZWRfXyTulawg7ABJf
 8pUk4SS7ZtEzQFwB3Zmd+U71TAI5aG3BZKSJ60ySshkmHf2/ZWs55GI7+JtTkkefakhfiE9dBbv
 GGtMNQsJCYZfgOxpB9JYWOKKOxHmdCg=
X-Proofpoint-ORIG-GUID: nFQMPfmyPGKLKd20hu7QBqB_RLAWQFad
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_01,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260024

On Mon, Aug 17, 2026 at 03:18:30PM +0200, Konrad Dybcio wrote:
> On 8/15/26 3:25 PM, Shawn Guo wrote:
> > On Nord, ADSP0/1/2 share HPASS-domain resources (PLLs, AG_NOC, RSCp,
> > CESTA, THROTTLE, QTMR) owned by ADSP0, and their firmware cannot
> > tolerate one member being started or stopped independently of the
> > others. Modeling that requires each PAS instance to know which other
> > instances it is grouped with.
> 
> [...]
> 
> > +static struct qcom_pas_cluster *qcom_pas_cluster_get(struct device_node *node)
> > +{
> > +	struct qcom_pas_cluster *cluster;
> > +
> > +	mutex_lock(&qcom_pas_cluster_list_lock);
> 
> Use scoped mutex guards

Will do in the next version, thanks!

> 
> [...]
> 
> > +static int qcom_pas_cluster_init(struct qcom_pas *pas, struct device_node *np)
> > +{
> > +	struct device_node *root_node;
> > +	bool is_root;
> > +
> > +	root_node = of_parse_phandle(np, "qcom,cluster-root", 0);
> > +	if (!root_node)
> > +		return 0;
> > +
> > +	is_root = root_node == np;
> > +
> > +	/*
> > +	 * A non-root member is useless without its root: it can never be
> > +	 * booted, since its boot has to be sequenced after the root's. Reject
> > +	 * it here rather than at first boot, so that a DT enabling a dependent
> > +	 * DSP but not the one owning the shared resources fails loudly and
> > +	 * early.
> > +	 */
> > +	if (!is_root && !of_device_is_available(root_node)) {
> 
> Let's use fwnode_device_is_available() instead, even though there's
> megatons of OF-specific calls across the framework

Noted! But this will probably be gone anyway with Krzysztof's comment
that property "qcom,cluster-root" is not really necessary.

Shawn
