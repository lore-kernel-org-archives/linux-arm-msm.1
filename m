Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4954636654C
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2026 17:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790875437; cv=none; b=RSL9P9clWAOu7U7dlT1u/OCy3092HSN9JkIFxqRXZzAXIQ2DNg03UjMSVKKHXom0M3iY+ysY6rWIkRce6z1+VxiWY3ettnmxYk/K+74aE2SQAKc5zvlqlNoQkc8G90w5q1XfYf8qsRYJ9sweI7cfs3HN4TLOPCc2UnhYzwtzJLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790875437; c=relaxed/simple;
	bh=a2XE9IZEbJd7dysTKHxHEzzeFg5rW1x5y81DsHhfRaA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=l212CbUWQ6rFS2JUhIClQxPHtsDMAKJNaKZLlYwt8Q/lS73KSPlltqW7dYYzhAlX9u1mUrhs6RdMfblzDGm0gMCgfdF86hdTeEjOy+iqJBvjGIvkCZZosyhYz7qrJWBvoaiYnZGwAHs1JXZCzp2KJ2P8nR2HJtXwDrBceKib1M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jUaNCiIr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jUaNCiIr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D1371F0089B;
	Thu,  1 Oct 2026 17:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790875435;
	bh=Q5Foi0kZzc5XVOQgiPl/iROSadiQpG5KvhIiHwFzWog=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=jUaNCiIrWvqjoKOhOj5mUsGhVwFN6NcjPX1JnKAbyPzNrglXO7X8sMRilfvHALFxv
	 gNiDcl/x0+XwKZGEhxK7p3tpN16kEJp74cMnFvUNVTEuA6Joq4+8ZzC0skIBNC8QOk
	 XbtbcBVFzcxGwW/crlUZk00+E62b4vd90V11GpNyTxbg1KnRib0jDmSElEvkCEHxqm
	 jcD2ctzXrXRUduWreDIG7nolRQ4w+u1eytBHg2ouR/KA95jtIAcjJHVt5sbncw+QYH
	 wLF2Qx+9STHMOnpC3k/9JVjInjIdIsCpvX5NFfoZcLVHDhgN1y0Z7V/jH+moI+iXTq
	 OYQxmcvez5sMA==
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 01 Oct 2026 19:23:49 +0200
Message-Id: <DLTOCUDLX5ZR.2DUZPGUB9CAE2@kernel.org>
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
 <ar6VjOgZYGeTsc+M@gsse-cloud1.jf.intel.com>
In-Reply-To: <ar6VjOgZYGeTsc+M@gsse-cloud1.jf.intel.com>

On Thu Oct 1, 2026 at 7:17 PM CEST, Matthew Brost wrote:
> On Thu, Oct 01, 2026 at 06:43:13PM +0200, Danilo Krummrich wrote:
>> On Thu Oct 1, 2026 at 6:19 PM CEST, Matthew Brost wrote:
>> >   drm/msm: use DRM_GPUVM_RESV_PROTECTED for VM_BIND VMs
>>=20
>> That's great! But the title suggests there are other VMs without this?
>>=20
>
> What exactly are you asking?

In my feedback from v1 I mentioned that having the feature for
DRM_GPUVM_RESV_PROTECTED only is unfortunate and that I think that we could=
 get
rid of !DRM_GPUVM_RESV_PROTECTED entirely.

MSM and nouveau are the only users of !DRM_GPUVM_RESV_PROTECTED, and I ment=
ioned
in v1 that I'm happy to have a look at this after LPC. I.e. scanning the pa=
tch
titles of v2 only, this looked like it was referring to this.
