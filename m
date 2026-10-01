Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 599004A4F19
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2026 17:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790874815; cv=none; b=jr2KhelUXB+SVy0rqEiWdMpQAYi/YOpJiEf3WuuymvEl6hGXoMuTKh0sO7OVhR/LayK1xrr4+AWTLL/YIhUpZKW3WdvQ6P9n7pZ3HysGkxzES3p2oybsiQz+BeFrsgwn6HPD5aqPH7yU8RCgpMrMnEZj13t7GHWcjBhU1I3KR+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790874815; c=relaxed/simple;
	bh=dgzFg8umASUHfOhqy95o2wgmBDH+Mz2tr+X0MCHuArY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=sYxi/OgZJGvhPK1MS+3wRvrBL638uILgp+KNQ5miz8yEURlsG7jwZqrN7G0XGAJjjGpjb5tIQC0WjRKAQ06m7msOIVBwiKN1J68/8ia1hTtg4oskUwE28rN9BXIFxwLQPoZ0FyRM0k/Q+1i70pxES26prteeEnkWIdZp45eR9AE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WRcYznyr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WRcYznyr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97C0E1F000FF;
	Thu,  1 Oct 2026 17:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790874812;
	bh=dgzFg8umASUHfOhqy95o2wgmBDH+Mz2tr+X0MCHuArY=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=WRcYznyrLjWKz8euJYLWn55MQlO2W8wQc2ZNT9xXudVUn4Xlm4dMtT+abdX8Vp2gA
	 XoXJiq674CeDQ+zM6+bul8H10sXpdKhUunCuzim8MX1NZaePJEvOpIPi2qnnBeNm3n
	 fFd+uFLbNz8Jx4AtMJAXATuB8u9GGZmOhBkgSmYewsY4J/n3V/NZdp1sjGmhbghUwa
	 V5KBIJ03k8nHbpSt4vk2IchUTEL5wkNEkTewK9F4bDuSZHPILre4xEud0jwLzOMHqU
	 gBz6xEw0WdvKPo+UlDwXqp+y8BFtfVFJjbk+b/KcQ1hR3o0uNHJpP/T0XTp1dCDN04
	 t9FX2BVCQA08w==
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 01 Oct 2026 19:13:25 +0200
Message-Id: <DLTO4W4IKEHY.J98404VTPJH5@kernel.org>
Subject: Re: [PATCH v2 0/5] drm/gpuvm: two pass locking for exec
Cc: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 "Abhinav Kumar" <abhinav.kumar@linux.dev>, "Alice Ryhl"
 <aliceryhl@google.com>, "Anna Maniscalco" <anna.maniscalco2000@gmail.com>,
 "Boris Brezillon" <boris.brezillon@collabora.com>, "David Airlie"
 <airlied@gmail.com>, "Dmitry Baryshkov" <lumag@kernel.org>, "Jessica Zhang"
 <jesszhan0024@gmail.com>, "Jonathan Corbet" <corbet@lwn.net>, "Liviu Dudau"
 <liviu.dudau@arm.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Marijn Suijten"
 <marijn.suijten@somainline.org>, "Maxime Ripard" <mripard@kernel.org>,
 "Randy Dunlap" <rdunlap@infradead.org>, "Rob Clark"
 <robin.clark@oss.qualcomm.com>, "Rodrigo Vivi" <rodrigo.vivi@intel.com>,
 "Sean Paul" <sean@poorly.run>, "Shuah Khan" <skhan@linuxfoundation.org>,
 "Simona Vetter" <simona@ffwll.ch>, "Steven Price" <steven.price@arm.com>,
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Thomas Zimmermann" <tzimmermann@suse.de>
To: "Matthew Brost" <matthew.brost@intel.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20261001162001.3123877-1-matthew.brost@intel.com>
 <DLTNHRLY3O63.16FANFZDPKAPW@kernel.org>
In-Reply-To: <DLTNHRLY3O63.16FANFZDPKAPW@kernel.org>

On Thu Oct 1, 2026 at 6:43 PM CEST, Danilo Krummrich wrote:
> I couldn't find a changelog for v2, can you share it please?

Hm...having a look at the series anyway it seems the feedback from v1 hasn'=
t
been considered?

Thanks,
Danilo
